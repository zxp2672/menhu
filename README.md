# 成都天府志达科技门户网站

## 项目概述

本项目是成都天府志达科技有限公司的企业门户网站,包含前端展示网站和后台管理系统。

## 项目结构

```
tianfu-zhida-portal/
├── frontend/              # 前端展示网站(Vue 3)
├── backend/               # 后端API服务(Node.js + Express)
├── admin/                 # 后台管理系统(Vue 3)
└── database/              # 数据库初始化脚本
```

## 技术栈

### 前端网站
- Vue.js 3
- Vue Router
- Vuex
- Element Plus
- Axios
- ECharts

### 后端服务
- Node.js
- Express.js
- Sequelize (ORM)
- MySQL
- JWT认证

### 后台管理
- Vue.js 3
- Element Plus
- Pinia
- ECharts

## 环境要求

- Node.js >= 16.0.0
- MySQL >= 8.0
- npm 或 yarn

## 访问地址

- **网站地址**: https://001tf.com (HTTP自动跳转HTTPS)
- **后台管理**: https://001tf.com/admin
- **API接口**: https://001tf.com/api

### 网站信息
- **ICP备案**: 蜀ICP备2024062329号-1
- **联系电话**: 18000588805
- **联系人**: 祝经理

## 安装与运行

### 1. 数据库配置

```bash
# 登录MySQL
mysql -u root -p

# 执行初始化脚本
source database/init.sql
```

### 2. 后端服务

```bash
cd backend

# 安装依赖
npm install

# 配置环境变量
# 编辑 .env 文件,设置正确的数据库连接信息

# 开发模式运行
npm run dev

# 生产模式运行
npm start
```

后端服务默认运行在: http://localhost:5000

### 3. 前端网站

```bash
cd frontend

# 安装依赖
npm install

# 开发模式运行
npm run dev

# 构建生产版本
npm run build
```

前端网站默认运行在: http://localhost:3000

### 4. 后台管理系统

```bash
cd admin

# 安装依赖
npm install

# 开发模式运行
npm run dev

# 构建生产版本
npm run build
```

后台管理系统默认运行在: http://localhost:3001

## 默认账号

### 后台管理
- 用户名: admin
- 密码: admin123

## 主要功能

### 前端网站
- 首页展示(Hero区域、核心服务、技术优势、案例精选)
- 解决方案展示(OA、ERP、CRM、行业定制)
- 技术实力展示
- 成功案例展示
- 关于我们
- 在线留言

### 后台管理
- 数据统计看板
- 案例管理(增删改查)
- 留言管理
- 解决方案管理
- 系统设置

## API接口

### 认证接口
- POST /api/auth/login - 管理员登录
- POST /api/auth/refresh-token - 刷新Token

### 案例接口
- GET /api/cases - 获取案例列表
- GET /api/cases/:id - 获取案例详情
- POST /api/cases - 创建案例(需认证)
- PUT /api/cases/:id - 更新案例(需认证)
- DELETE /api/cases/:id - 删除案例(需认证)

### 留言接口
- POST /api/messages - 提交留言
- GET /api/messages - 获取留言列表(需认证)
- PUT /api/messages/:id/status - 更新留言状态(需认证)

## 安全特性

- JWT Token认证
- 密码bcrypt加密
- SQL注入防护(Sequelize ORM)
- XSS防护
- API请求限流
- Helmet安全头
- CORS配置

## SEO优化

- 关键词优化
- Meta标签配置
- 语义化HTML
- 响应式设计

## 开发规范

- 组件化开发
- RESTful API设计
- 统一错误处理
- 代码注释规范

## 部署建议

### 前端部署
- 使用Nginx部署静态文件
- 配置HTTPS
- 启用Gzip压缩
- 配置缓存策略

### 后端部署
- 使用PM2进程管理
- 配置环境变量
- 设置日志轮转
- 定期数据库备份

## 后续扩展

- 集成高德地图API
- 接入百度统计/Google Analytics
- 文件上传OSS存储
- 邮件通知功能
- 数据导出功能
- API接口文档(Swagger)

## 联系方式

- 地址: 成都市武侯区复城国际T1写字楼1601
- 电话: 028-xxxx-xxxx
- 邮箱: info@zhida-tech.com

## 许可证

Copyright © 2026 成都天府志达科技有限公司
