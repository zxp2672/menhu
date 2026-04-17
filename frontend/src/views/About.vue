<template>
  <div class="about-page">
    <Header />
    
    <section class="page-header">
      <div class="container">
        <h1>关于我们</h1>
        <p>成都天府志达科技有限公司</p>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="about-content">
          <h2>公司简介</h2>
          <p class="intro-text">
            成都天府志达科技有限公司是一家专注于软件定制化开发的高新技术企业。公司依托电子科技大学技术团队的科研优势,致力于为企业提供高品质的数字化解决方案。
          </p>
          <p>
            我们拥有一支经验丰富的研发团队,在OA办公系统、ERP企业资源计划、CRM客户关系管理等领域深耕多年,已成功为政府、教育、制造等多个行业提供定制化软件开发服务。
          </p>
        </div>

        <div class="founder">
          <h2>创始人致辞</h2>
          <div class="founder-content">
            <div class="founder-info">
              <h3>祝小平</h3>
              <p class="title">创始人 & CEO</p>
            </div>
            <div class="founder-message">
              <p>"我们始终坚持技术驱动、品质卓越的理念,以客户需求为导向,用专业的技术和优质的服务,帮助企业实现数字化转型。"</p>
            </div>
          </div>
        </div>

        <div class="history">
          <h2>发展历程</h2>
          <div class="timeline">
            <div class="timeline-item" v-for="(item, index) in history" :key="index">
              <div class="timeline-year">{{ item.year }}</div>
              <div class="timeline-content">
                <h3>{{ item.title }}</h3>
                <p>{{ item.desc }}</p>
              </div>
            </div>
          </div>
        </div>

        <div class="location">
          <h2>办公地址</h2>
          <p class="address">成都市武侯区复城国际T1写字楼1601</p>
        </div>
      </div>
    </section>

    <Footer />
  </div>
</template>

<script setup>
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'

const history = [
  { year: '2015', title: '公司成立', desc: '成都天府志达科技有限公司正式成立，开启软件定制开发之路' },
  { year: '2016', title: '技术积累', desc: '组建核心技术团队，完成首批产品研发' },
  { year: '2017', title: '业务起步', desc: '首批客户项目成功交付，获得市场认可' },
  { year: '2018', title: '软著认证', desc: '获得首批软件著作权认证，技术实力获认可' },
  { year: '2019', title: '业务扩展', desc: '服务范围覆盖OA、ERP、CRM等多个领域' },
  { year: '2020', title: '行业深耕', desc: '深入医疗、零售、物流等行业，提供专业解决方案' },
  { year: '2021', title: '高企认证', desc: '获得国家高新技术企业认证' },
  { year: '2022', title: '专利获批', desc: '获得2项核心技术专利，技术壁垒进一步巩固' },
  { year: '2023', title: '快速发展', desc: '服务客户突破200家，覆盖10+行业' },
  { year: '2024', title: '持续创新', desc: '完成ICP备案，网站全面升级，开启发展新篇章' }
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

.about-content {
  max-width: 900px;
  margin: 0 auto 80px;
  
  h2 {
    font-size: 36px;
    color: #1a1a2e;
    margin-bottom: 30px;
    text-align: center;
  }
  
  p {
    font-size: 16px;
    color: #666;
    line-height: 1.8;
    margin-bottom: 20px;
  }
  
  .intro-text {
    font-size: 18px;
    color: #333;
    font-weight: 500;
  }
}

.founder {
  background: #f5f7fa;
  padding: 60px 40px;
  border-radius: 8px;
  margin-bottom: 80px;
  
  h2 {
    font-size: 36px;
    color: #1a1a2e;
    margin-bottom: 40px;
    text-align: center;
  }
}

.founder-content {
  max-width: 800px;
  margin: 0 auto;
  text-align: center;
}

.founder-info {
  margin-bottom: 30px;
  
  h3 {
    font-size: 28px;
    color: #1a1a2e;
    margin-bottom: 10px;
  }
  
  .title {
    font-size: 16px;
    color: #00d4ff;
  }
}

.founder-message {
  p {
    font-size: 20px;
    color: #333;
    line-height: 1.8;
    font-style: italic;
  }
}

.history {
  margin-bottom: 80px;
  
  h2 {
    font-size: 36px;
    color: #1a1a2e;
    margin-bottom: 50px;
    text-align: center;
  }
}

.timeline {
  max-width: 800px;
  margin: 0 auto;
}

.timeline-item {
  display: flex;
  gap: 30px;
  margin-bottom: 40px;
  
  .timeline-year {
    font-size: 24px;
    font-weight: bold;
    color: #00d4ff;
    min-width: 80px;
  }
  
  .timeline-content {
    flex: 1;
    padding-left: 30px;
    border-left: 3px solid #00d4ff;
    
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
}

.location {
  text-align: center;
  
  h2 {
    font-size: 36px;
    color: #1a1a2e;
    margin-bottom: 20px;
  }
  
  .address {
    font-size: 18px;
    color: #666;
  }
}
</style>
