<template>
  <div class="solutions-page">
    <Header />
    
    <section class="page-header">
      <div class="container">
        <h1>解决方案</h1>
        <p>为企业提供全方位的软件定制开发解决方案</p>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="solutions-tabs">
          <button 
            v-for="tab in tabs" 
            :key="tab.type"
            :class="['tab-btn', { active: activeTab === tab.type }]"
            @click="activeTab = tab.type"
          >
            {{ tab.label }}
          </button>
        </div>

        <div class="solution-content">
          <div class="solution-header">
            <h2>{{ currentSolution.title }}</h2>
            <p class="solution-desc">{{ currentSolution.description }}</p>
          </div>

          <div class="solution-features">
            <h3>核心功能</h3>
            <div class="features-grid">
              <div class="feature-item" v-for="(feature, index) in currentSolution.features" :key="index">
                <div class="feature-icon">{{ feature.icon }}</div>
                <h4>{{ feature.title }}</h4>
                <p>{{ feature.desc }}</p>
              </div>
            </div>
          </div>

          <div class="solution-benefits">
            <h3>方案优势</h3>
            <ul class="benefits-list">
              <li v-for="(benefit, index) in currentSolution.benefits" :key="index">
                ✓ {{ benefit }}
              </li>
            </ul>
          </div>

          <div class="cta-section">
            <router-link to="/contact" class="btn btn-primary">咨询此方案</router-link>
          </div>
        </div>
      </div>
    </section>

    <Footer />
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'

const activeTab = ref('oa')

const tabs = [
  { type: 'oa', label: 'OA办公系统' },
  { type: 'erp', label: 'ERP系统' },
  { type: 'crm', label: 'CRM系统' },
  { type: 'custom', label: '行业软件定制' }
]

const solutions = {
  oa: {
    title: 'OA办公系统定制开发',
    description: '为企业打造高效的办公自动化系统，实现流程电子化、移动化、智能化管理',
    features: [
      { icon: '📝', title: '流程审批', desc: '自定义审批流程，支持多级审批、并行审批' },
      { icon: '📱', title: '移动办公', desc: '支持移动端访问，随时随地处理工作' },
      { icon: '📊', title: '数据统计', desc: '实时统计分析，提供决策支持' },
      { icon: '🔔', title: '消息通知', desc: '智能消息推送，重要事项及时提醒' }
    ],
    benefits: [
      '提升办公效率30%以上',
      '降低沟通成本，减少纸质文档',
      '全程留痕，便于追溯和审计',
      '支持与企业现有系统集成'
    ]
  },
  erp: {
    title: 'ERP企业资源计划系统',
    description: '整合企业核心业务流程，实现资源优化配置和精细化管理',
    features: [
      { icon: '📦', title: '供应链管理', desc: '采购、库存、销售全链条管理' },
      { icon: '💰', title: '财务管理', desc: '财务核算、成本控制、预算管理' },
      { icon: '🏭', title: '生产管理', desc: '生产计划、工序管理、质量检测' },
      { icon: '👥', title: '人力资源管理', desc: '员工档案、考勤、薪酬管理' }
    ],
    benefits: [
      '实现企业资源一体化管理',
      '降低运营成本15-20%',
      '提升供应链响应速度',
      '数据驱动决策，提高管理效率'
    ]
  },
  crm: {
    title: 'CRM客户关系管理系统',
    description: '帮助企业建立完善的客户管理体系，提升客户满意度和忠诚度',
    features: [
      { icon: '🎯', title: '销售漏斗', desc: '可视化销售流程，精准把控每个阶段' },
      { icon: '👤', title: '客户画像', desc: '360度客户视图，深度了解客户需求' },
      { icon: '📈', title: '数据分析', desc: '销售预测、业绩分析、趋势洞察' },
      { icon: '💼', title: '商机管理', desc: '商机跟踪、转化分析、优先级排序' }
    ],
    benefits: [
      '提升销售转化率25%以上',
      '增强客户粘性，降低流失率',
      '精细化客户分类管理',
      '数据驱动精准营销'
    ]
  },
  custom: {
    title: '行业软件定制开发',
    description: '根据特定行业需求，提供专属软件定制开发服务，覆盖医疗、零售、物流、金融、建筑、电商等多个领域',
    features: [
      { icon: '🏥', title: '医疗行业', desc: 'HIS系统、电子病历、药品管理、预约挂号' },
      { icon: '🛍️', title: '零售连锁', desc: '多门店管理、会员营销、库存同步、数据分析' },
      { icon: '🚚', title: '物流运输', desc: 'TMS系统、订单调度、实时跟踪、智能配载' },
      { icon: '💳', title: '金融服务', desc: '风控系统、信贷管理、资产监控、合规审计' },
      { icon: '🏗️', title: '建筑工程', desc: '项目管理、进度管控、质量检测、成本核算' },
      { icon: '🛒', title: '电商平台', desc: 'B2B/B2C商城、多商户、智能推荐、营销工具' },
      { icon: '🎓', title: '教育培训', desc: '在线学习、考试系统、学员管理、教务管理' },
      { icon: '🏭', title: '生产制造', desc: 'MES系统、工艺管理、质量追溯、设备监控' },
      { icon: '🔧', title: '需求分析', desc: '深度调研，精准把握业务需求' },
      { icon: '🎨', title: '定制设计', desc: '量身定制，贴合行业特色' },
      { icon: '⚡', title: '敏捷开发', desc: '快速迭代，持续优化产品' },
      { icon: '🛡️', title: '安全可靠', desc: '严格测试，保障系统稳定运行' }
    ],
    benefits: [
      '完全贴合企业业务流程，度身定制',
      '自主知识产权，不受制于人',
      '覆盖10+行业解决方案经验',
      '持续迭代升级，与时俱进',
      '专业技术团队全程支持',
      '已成功服务200+企业客户'
    ]
  }
}

const currentSolution = computed(() => solutions[activeTab.value])
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
    
    @media (max-width: 768px) {
      font-size: 36px;
    }
  }
  
  p {
    font-size: 18px;
    color: rgba(255, 255, 255, 0.8);
  }
}

.solutions-tabs {
  display: flex;
  gap: 20px;
  margin-bottom: 50px;
  justify-content: center;
  flex-wrap: wrap;
}

.tab-btn {
  padding: 12px 30px;
  border: 2px solid #00d4ff;
  background: transparent;
  color: #00d4ff;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  transition: all 0.3s;
  
  &.active,
  &:hover {
    background: #00d4ff;
    color: #fff;
  }
}

.solution-content {
  max-width: 1000px;
  margin: 0 auto;
}

.solution-header {
  text-align: center;
  margin-bottom: 50px;
  
  h2 {
    font-size: 36px;
    color: #1a1a2e;
    margin-bottom: 15px;
  }
  
  .solution-desc {
    font-size: 16px;
    color: #666;
  }
}

.solution-features {
  margin-bottom: 50px;
  
  h3 {
    font-size: 28px;
    color: #1a1a2e;
    margin-bottom: 30px;
    text-align: center;
  }
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 30px;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
  }
}

.feature-item {
  padding: 30px;
  background: #f5f7fa;
  border-radius: 8px;
  transition: all 0.3s;
  
  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  }
  
  .feature-icon {
    font-size: 36px;
    margin-bottom: 15px;
  }
  
  h4 {
    font-size: 20px;
    color: #1a1a2e;
    margin-bottom: 10px;
  }
  
  p {
    font-size: 14px;
    color: #666;
    line-height: 1.6;
  }
}

.solution-benefits {
  margin-bottom: 50px;
  
  h3 {
    font-size: 28px;
    color: #1a1a2e;
    margin-bottom: 30px;
    text-align: center;
  }
}

.benefits-list {
  list-style: none;
  max-width: 600px;
  margin: 0 auto;
  
  li {
    padding: 15px 0;
    font-size: 16px;
    color: #333;
    border-bottom: 1px solid #e4e7ed;
  }
}

.cta-section {
  text-align: center;
}
</style>
