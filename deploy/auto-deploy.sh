#!/bin/bash
# 天府志达门户网站一键部署脚本

echo "========================================="
echo "天府志达门户网站 - 自动化部署脚本"
echo "========================================="

# 1. 启动MySQL
echo -e "\n[1/8] 启动MySQL服务..."
systemctl start mysqld
systemctl enable mysqld
sleep 3

# 2. 重置MySQL root密码(使用skip-grant-tables)
echo -e "\n[2/8] 配置MySQL root密码..."
systemctl stop mysqld
mysqld --user=mysql --skip-grant-tables --skip-networking &
sleep 3

mysql -u root <<MYSQL_SCRIPT
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Zhida@2026!Secure';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

killall mysqld
sleep 2
systemctl start mysqld
sleep 2

# 3. 创建数据库并导入数据
echo -e "\n[3/8] 创建数据库并导入数据..."
mysql -u root -p'Zhida@2026!Secure' -e "CREATE DATABASE IF NOT EXISTS zhida_portal DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;"
mysql -u root -p'Zhida@2026!Secure' zhida_portal < /opt/zhida-portal/init-db.sql
echo "✓ 数据库创建成功"

# 4. 验证数据库
echo -e "\n[4/8] 验证数据库表..."
mysql -u root -p'Zhida@2026!Secure' zhida_portal -e "SHOW TABLES;"

# 5. 启动后端服务
echo -e "\n[5/8] 启动后端服务..."
cd /opt/zhida-portal/backend
pm2 delete zhida-backend 2>/dev/null
pm2 start src/app.js --name zhida-backend
pm2 save
pm2 startup
echo "✓ 后端服务已启动"

# 6. 配置Nginx
echo -e "\n[6/8] 配置Nginx..."
nginx -t
if [ $? -eq 0 ]; then
    systemctl reload nginx
    echo "✓ Nginx配置成功"
else
    echo "✗ Nginx配置有误,请检查"
    exit 1
fi

# 7. 配置防火墙
echo -e "\n[7/8] 配置防火墙..."
firewall-cmd --permanent --add-port=80/tcp 2>/dev/null
firewall-cmd --permanent --add-port=5000/tcp 2>/dev/null
firewall-cmd --reload 2>/dev/null
echo "✓ 防火墙配置完成"

# 8. 验证服务
echo -e "\n[8/8] 验证服务状态..."
echo -e "\n--- PM2进程状态 ---"
pm2 list

echo -e "\n--- 后端健康检查 ---"
curl -s http://localhost:5000/api/health || echo "后端API检查完成"

echo -e "\n--- Nginx状态 ---"
systemctl is-active nginx

echo -e "\n========================================="
echo "✅ 部署完成!"
echo "========================================="
echo "前端地址: http://001tf.com"
echo "后端API: http://001tf.com/api"
echo "后台管理: http://001tf.com/admin"
echo ""
echo "数据库信息:"
echo "  - 数据库: zhida_portal"
echo "  - 用户: root"
echo "  - 密码: Zhida@2026!Secure"
echo ""
echo "查看日志: pm2 logs zhida-backend"
echo "========================================="
