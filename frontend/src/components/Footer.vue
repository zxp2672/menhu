<template>
  <footer class="footer">
    <div class="container">
      <div class="footer-content">
        <div class="footer-section">
          <h3>天府志达科技</h3>
          <p>专业软件定制化开发服务</p>
          <p class="footer-desc">依托电子科技大学技术团队，为企业提供高品质数字化解决方案</p>
        </div>
        
        <div class="footer-section">
          <h4>快速链接</h4>
          <ul>
            <li><router-link to="/solutions">解决方案</router-link></li>
            <li><router-link to="/technology">技术实力</router-link></li>
            <li><router-link to="/cases">成功案例</router-link></li>
            <li><router-link to="/about">关于我们</router-link></li>
          </ul>
        </div>
        
        <div class="footer-section">
          <h4>联系方式</h4>
          <ul class="contact-info">
            <li>联系人：祝经理</li>
            <li>电话：18000588805</li>
            <li>邮箱：info@zhida-tech.com</li>
            <li>地址：成都市武侯区复城国际T1写字楼1601</li>
          </ul>
        </div>
        
        <div class="footer-section">
          <h4>关注我们</h4>
          <div class="social-links">
            <a href="#" class="social-icon">微信</a>
            <a href="#" class="social-icon">微博</a>
          </div>
        </div>
      </div>
      
      <div class="footer-bottom">
        <p>&copy; 2026 成都天府志达科技有限公司 版权所有</p>
        <p class="icp"><a href="https://beian.miit.gov.cn/" target="_blank" rel="noopener">蜀ICP备2024062329号-1</a></p>
      </div>
    </div>
  </footer>
</template>

<script setup>
</script>

<style scoped lang="scss">
.footer {
  background: #1a1a2e;
  color: #fff;
  padding: 60px 0 30px;
}

.footer-content {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 40px;
  margin-bottom: 40px;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
    gap: 30px;
  }
}

.footer-section {
  h3 {
    font-size: 20px;
    margin-bottom: 15px;
    color: #00d4ff;
  }
  
  h4 {
    font-size: 16px;
    margin-bottom: 15px;
    color: #00d4ff;
  }
  
  p {
    font-size: 14px;
    line-height: 1.8;
    color: rgba(255, 255, 255, 0.7);
  }
  
  ul {
    list-style: none;
    
    li {
      margin-bottom: 10px;
      
      a {
        color: rgba(255, 255, 255, 0.7);
        transition: color 0.3s;
        
        &:hover {
          color: #00d4ff;
        }
      }
    }
  }
}

.footer-desc {
  margin-top: 10px;
}

.contact-info {
  li {
    font-size: 14px;
    color: rgba(255, 255, 255, 0.7);
  }
}

.social-links {
  display: flex;
  gap: 15px;
  
  .social-icon {
    display: inline-block;
    padding: 8px 16px;
    background: rgba(0, 212, 255, 0.1);
    border: 1px solid #00d4ff;
    border-radius: 4px;
    color: #00d4ff;
    font-size: 14px;
    transition: all 0.3s;
    
    &:hover {
      background: #00d4ff;
      color: #1a1a2e;
    }
  }
}

.footer-bottom {
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  padding-top: 20px;
  text-align: center;
  
  p {
    font-size: 13px;
    color: rgba(255, 255, 255, 0.5);
    margin-bottom: 5px;
  }
}
</style>
