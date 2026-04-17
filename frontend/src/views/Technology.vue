<template>
  <div class="technology-page">
    <Header />
    
    <section class="page-header">
      <div class="container">
        <h1>技术实力</h1>
        <p>依托电子科技大学科研实力,打造技术壁垒</p>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="tech-content">
          <h2>研发流程</h2>
          <div class="process-timeline">
            <div class="process-step" v-for="(step, index) in process" :key="index">
              <div class="step-number">{{ index + 1 }}</div>
              <h3>{{ step.title }}</h3>
              <p>{{ step.desc }}</p>
            </div>
          </div>
        </div>

        <div class="certificates">
          <h2>资质认证</h2>
          <div class="cert-grid">
            <div class="cert-item">
              <div class="cert-icon">📜</div>
              <h3>25项软件著作权</h3>
              <p>覆盖OA、ERP、CRM等多个领域</p>
            </div>
            <div class="cert-item">
              <div class="cert-icon">🏆</div>
              <h3>2项专利技术</h3>
              <p>核心技术创新突破</p>
            </div>
            <div class="cert-item">
              <div class="cert-icon">🎖️</div>
              <h3>高新技术企业</h3>
              <p>国家认证高新技术企业</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <Footer />
  </div>
</template>

<script setup>
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'

const process = [
  { title: '需求调研', desc: '深入了解客户需求,明确项目目标' },
  { title: '方案设计', desc: '制定技术方案,设计系统架构' },
  { title: '开发实现', desc: '敏捷开发,快速迭代' },
  { title: '测试优化', desc: '严格测试,确保质量' },
  { title: '部署上线', desc: '系统部署,正式上线' },
  { title: '运维支持', desc: '持续运维,技术支持' }
]
</script>

<style scoped lang="scss">
.page-header {
  background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
  color: #fff;
  padding: 150px 0 80px;
  text-align: center;
  
  h1 {
    font-size: 48px;
    margin-bottom: 20px;
  }
  
  p {
    font-size: 18px;
    color: rgba(255, 255, 255, 0.8);
  }
}

.tech-content {
  margin-bottom: 80px;
  
  h2 {
    font-size: 36px;
    color: #1a1a2e;
    margin-bottom: 50px;
    text-align: center;
  }
}

.process-timeline {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 30px;
  
  @media (max-width: 768px) {
    grid-template-columns: repeat(2, 1fr);
  }
}

.process-step {
  text-align: center;
  padding: 30px;
  background: #f5f7fa;
  border-radius: 8px;
  
  .step-number {
    width: 50px;
    height: 50px;
    background: #00d4ff;
    color: #fff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    font-weight: bold;
    margin: 0 auto 20px;
  }
  
  h3 {
    font-size: 20px;
    color: #1a1a2e;
    margin-bottom: 10px;
  }
  
  p {
    font-size: 14px;
    color: #666;
  }
}

.certificates {
  h2 {
    font-size: 36px;
    color: #1a1a2e;
    margin-bottom: 50px;
    text-align: center;
  }
}

.cert-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 30px;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
  }
}

.cert-item {
  text-align: center;
  padding: 40px 30px;
  background: #f5f7fa;
  border-radius: 8px;
  transition: all 0.3s;
  
  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  }
  
  .cert-icon {
    font-size: 48px;
    margin-bottom: 20px;
  }
  
  h3 {
    font-size: 22px;
    color: #1a1a2e;
    margin-bottom: 10px;
  }
  
  p {
    font-size: 14px;
    color: #666;
  }
}
</style>
