<template>
  <div class="home">
    <Header />
    
    <!-- Hero区域 -->
    <section class="hero">
      <div class="hero-bg"></div>
      <div class="container">
        <div class="hero-content">
          <h1 class="hero-title">定制开发，赋能企业数字化未来</h1>
          <p class="hero-subtitle">依托电子科技大学技术团队，为您提供专业软件定制开发服务</p>
          <div class="hero-buttons">
            <router-link to="/solutions" class="btn btn-primary">了解解决方案</router-link>
            <router-link to="/contact" class="btn btn-outline">联系我们</router-link>
          </div>
        </div>
      </div>
    </section>

    <!-- 核心服务模块 -->
    <section class="section services">
      <div class="container">
        <h2 class="section-title">核心服务</h2>
        <p class="section-subtitle">为企业提供全方位的软件定制开发解决方案</p>
        
        <div class="services-grid">
          <div class="service-card" v-for="service in services" :key="service.type">
            <div class="service-icon">{{ service.icon }}</div>
            <h3>{{ service.title }}</h3>
            <p>{{ service.description }}</p>
            <router-link :to="`/solutions/${service.type}`" class="service-link">了解更多 →</router-link>
          </div>
        </div>
      </div>
    </section>

    <!-- 技术优势 -->
    <section class="section technology bg-light">
      <div class="container">
        <h2 class="section-title">技术优势</h2>
        <p class="section-subtitle">依托电子科技大学科研实力，打造技术壁垒</p>
        
        <div class="tech-stats">
          <div class="stat-item">
            <div class="stat-number">{{ stats.copyrights }}+</div>
            <div class="stat-label">软件著作权</div>
          </div>
          <div class="stat-item">
            <div class="stat-number">{{ stats.patents }}+</div>
            <div class="stat-label">专利技术</div>
          </div>
          <div class="stat-item">
            <div class="stat-number">{{ stats.clients }}+</div>
            <div class="stat-label">服务客户</div>
          </div>
          <div class="stat-item">
            <div class="stat-number">{{ stats.delivery }}%</div>
            <div class="stat-label">项目交付率</div>
          </div>
        </div>
        
        <div class="tech-highlights">
          <div class="highlight-item">
            <h3>🎓 电子科技大学技术团队</h3>
            <p>核心研发团队来自电子科技大学，具备深厚的学术研究背景和丰富的工程实践经验</p>
          </div>
          <div class="highlight-item">
            <h3>🏆 高新技术企业认证</h3>
            <p>通过国家高新技术企业认证，持续投入研发创新，保持技术领先优势</p>
          </div>
          <div class="highlight-item">
            <h3>💡 25项软件著作权</h3>
            <p>拥有25项软件著作权和2项专利技术，覆盖OA、ERP、CRM等多个领域</p>
          </div>
        </div>
      </div>
    </section>

    <!-- 客户案例精选 -->
    <section class="section cases">
      <div class="container">
        <h2 class="section-title">成功案例</h2>
        <p class="section-subtitle">已为众多企业提供优质数字化解决方案</p>
        
        <div class="cases-grid">
          <div class="case-card" v-for="caseItem in featuredCases" :key="caseItem.id">
            <div class="case-image">{{ caseItem.industry }}</div>
            <div class="case-content">
              <h3>{{ caseItem.title }}</h3>
              <p>{{ caseItem.description }}</p>
              <div class="case-tags">
                <span class="tag">{{ caseItem.industry }}</span>
                <span class="tag">{{ caseItem.type }}</span>
              </div>
              <router-link :to="`/cases/${caseItem.id}`" class="case-link">查看详情 →</router-link>
            </div>
          </div>
        </div>
        
        <div class="text-center" style="margin-top: 40px;">
          <router-link to="/cases" class="btn btn-outline">查看更多案例</router-link>
        </div>
      </div>
    </section>

    <Footer />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'

const services = [
  {
    type: 'oa',
    icon: '📋',
    title: 'OA办公系统',
    description: '定制化流程审批、移动办公、协同管理，提升企业办公效率'
  },
  {
    type: 'erp',
    icon: '📊',
    title: 'ERP企业资源计划',
    description: '供应链管理、财务一体化、库存管控，实现企业资源优化配置'
  },
  {
    type: 'crm',
    icon: '🤝',
    title: 'CRM客户关系管理',
    description: '销售漏斗管理、客户画像分析、精准营销，提升客户满意度'
  },
  {
    type: 'custom',
    icon: '⚙️',
    title: '行业软件定制',
    description: '针对特定行业需求，提供专属软件定制开发服务'
  }
]

const stats = ref({
  copyrights: 0,
  patents: 0,
  clients: 0,
  delivery: 0
})

const featuredCases = [
  {
    id: 1,
    title: '某政府机构OA系统',
    description: '为该政府机构定制开发全流程OA办公系统，实现审批流程电子化、移动化',
    industry: '政府',
    type: 'OA系统'
  },
  {
    id: 2,
    title: '某制造企业ERP系统',
    description: '整合供应链、财务、库存管理，实现企业资源一体化管理',
    industry: '制造',
    type: 'ERP系统'
  },
  {
    id: 3,
    title: '某教育机构CRM系统',
    description: '构建学员管理体系，实现招生、教学、服务全流程管理',
    industry: '教育',
    type: 'CRM系统'
  }
]

// 数字动画
const animateNumber = (target, key, duration = 2000) => {
  const start = 0
  const increment = target / (duration / 16)
  let current = start
  
  const timer = setInterval(() => {
    current += increment
    if (current >= target) {
      stats.value[key] = target
      clearInterval(timer)
    } else {
      stats.value[key] = Math.floor(current)
    }
  }, 16)
}

onMounted(() => {
  // 模拟数据，实际应从API获取
  setTimeout(() => {
    animateNumber(25, 'copyrights')
    animateNumber(2, 'patents')
    animateNumber(200, 'clients')
    animateNumber(98, 'delivery')
  }, 500)
})
</script>

<style scoped lang="scss">
.hero {
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
  overflow: hidden;
}

.hero-bg {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: 
    radial-gradient(circle at 20% 50%, rgba(0, 212, 255, 0.1) 0%, transparent 50%),
    radial-gradient(circle at 80% 80%, rgba(0, 212, 255, 0.08) 0%, transparent 50%);
  animation: pulse 8s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.7; }
}

.hero-content {
  position: relative;
  z-index: 1;
  text-align: center;
  color: #fff;
  max-width: 800px;
}

.hero-title {
  font-size: 48px;
  font-weight: bold;
  margin-bottom: 20px;
  line-height: 1.3;
  
  @media (max-width: 768px) {
    font-size: 32px;
  }
}

.hero-subtitle {
  font-size: 20px;
  margin-bottom: 40px;
  color: rgba(255, 255, 255, 0.8);
  
  @media (max-width: 768px) {
    font-size: 16px;
  }
}

.hero-buttons {
  display: flex;
  gap: 20px;
  justify-content: center;
  
  @media (max-width: 768px) {
    flex-direction: column;
    align-items: center;
  }
}

.services {
  background: #fff;
}

.services-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 30px;
  
  @media (max-width: 992px) {
    grid-template-columns: repeat(2, 1fr);
  }
  
  @media (max-width: 576px) {
    grid-template-columns: 1fr;
  }
}

.service-card {
  background: #fff;
  padding: 40px 30px;
  border-radius: 8px;
  text-align: center;
  transition: all 0.3s;
  border: 1px solid #e4e7ed;
  
  &:hover {
    transform: translateY(-10px);
    box-shadow: 0 10px 30px rgba(0, 212, 255, 0.2);
    border-color: #00d4ff;
  }
}

.service-icon {
  font-size: 48px;
  margin-bottom: 20px;
}

.service-card h3 {
  font-size: 22px;
  margin-bottom: 15px;
  color: #1a1a2e;
}

.service-card p {
  font-size: 14px;
  color: #666;
  line-height: 1.6;
  margin-bottom: 20px;
}

.service-link {
  color: #00d4ff;
  font-weight: 500;
  transition: all 0.3s;
  
  &:hover {
    color: #0099cc;
  }
}

.tech-stats {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 30px;
  margin-bottom: 60px;
  
  @media (max-width: 768px) {
    grid-template-columns: repeat(2, 1fr);
  }
}

.stat-item {
  text-align: center;
  padding: 30px;
  background: #fff;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.stat-number {
  font-size: 48px;
  font-weight: bold;
  color: #00d4ff;
  margin-bottom: 10px;
  
  @media (max-width: 768px) {
    font-size: 36px;
  }
}

.stat-label {
  font-size: 16px;
  color: #666;
}

.tech-highlights {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 30px;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
  }
}

.highlight-item {
  background: #fff;
  padding: 30px;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  
  h3 {
    font-size: 20px;
    margin-bottom: 15px;
    color: #1a1a2e;
  }
  
  p {
    font-size: 14px;
    color: #666;
    line-height: 1.6;
  }
}

.cases-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 30px;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
  }
}

.case-card {
  background: #fff;
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  transition: all 0.3s;
  
  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
  }
}

.case-image {
  height: 200px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  font-size: 24px;
  font-weight: bold;
}

.case-content {
  padding: 25px;
  
  h3 {
    font-size: 20px;
    margin-bottom: 10px;
    color: #1a1a2e;
  }
  
  p {
    font-size: 14px;
    color: #666;
    line-height: 1.6;
    margin-bottom: 15px;
  }
}

.case-tags {
  display: flex;
  gap: 10px;
  margin-bottom: 15px;
  
  .tag {
    padding: 4px 12px;
    background: rgba(0, 212, 255, 0.1);
    color: #00d4ff;
    border-radius: 4px;
    font-size: 12px;
  }
}

.case-link {
  color: #00d4ff;
  font-weight: 500;
  
  &:hover {
    color: #0099cc;
  }
}
</style>
