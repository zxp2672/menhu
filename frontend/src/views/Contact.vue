<template>
  <div class="contact-page">
    <Header />
    
    <section class="page-header">
      <div class="container">
        <h1>联系我们</h1>
        <p>期待与您的合作</p>
      </div>
    </section>

    <section class="section">
      <div class="container">
        <div class="contact-grid">
          <div class="contact-form-section">
            <h2>在线留言</h2>
            <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
              <el-form-item label="姓名" prop="name">
                <el-input v-model="form.name" placeholder="请输入您的姓名" />
              </el-form-item>
              
              <el-form-item label="电话" prop="phone">
                <el-input v-model="form.phone" placeholder="请输入您的联系电话" />
              </el-form-item>
              
              <el-form-item label="邮箱" prop="email">
                <el-input v-model="form.email" placeholder="请输入您的邮箱" />
              </el-form-item>
              
              <el-form-item label="公司名称" prop="company">
                <el-input v-model="form.company" placeholder="请输入公司名称" />
              </el-form-item>
              
              <el-form-item label="需求描述" prop="message">
                <el-input 
                  v-model="form.message" 
                  type="textarea" 
                  :rows="5"
                  placeholder="请描述您的需求" 
                />
              </el-form-item>
              
              <el-form-item>
                <el-button type="primary" @click="submitForm" size="large">
                  提交留言
                </el-button>
              </el-form-item>
            </el-form>
          </div>

          <div class="contact-info-section">
            <h2>联系方式</h2>
            <div class="info-item">
              <div class="info-icon">👤</div>
              <div>
                <h4>联系人</h4>
                <p>祝经理</p>
              </div>
            </div>
            
            <div class="info-item">
              <div class="info-icon">📞</div>
              <div>
                <h4>电话</h4>
                <p>18000588805</p>
              </div>
            </div>
            
            <div class="info-item">
              <div class="info-icon">📧</div>
              <div>
                <h4>邮箱</h4>
                <p>info@zhida-tech.com</p>
              </div>
            </div>
            
            <div class="info-item">
              <div class="info-icon">📍</div>
              <div>
                <h4>地址</h4>
                <p>成都市武侯区复城国际T1写字楼1601</p>
              </div>
            </div>
            
            <div class="info-item">
              <div class="info-icon">🕐</div>
              <div>
                <h4>工作时间</h4>
                <p>周一至周五 9:00-18:00</p>
              </div>
            </div>
          </div>
        </div>

        <div class="map-section">
          <h2>位置导航</h2>
          <div class="map-placeholder">
            <p>高德地图集成区域</p>
            <p class="map-note">实际部署时将集成高德地图API</p>
          </div>
        </div>
      </div>
    </section>

    <Footer />
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { ElMessage } from 'element-plus'
import Header from '@/components/Header.vue'
import Footer from '@/components/Footer.vue'

const formRef = ref(null)

const form = ref({
  name: '',
  phone: '',
  email: '',
  company: '',
  message: ''
})

const rules = {
  name: [{ required: true, message: '请输入姓名', trigger: 'blur' }],
  phone: [
    { required: true, message: '请输入电话', trigger: 'blur' },
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号', trigger: 'blur' }
  ],
  email: [
    { required: true, message: '请输入邮箱', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱格式', trigger: 'blur' }
  ],
  message: [{ required: true, message: '请输入需求描述', trigger: 'blur' }]
}

const submitForm = async () => {
  if (!formRef.value) return
  
  await formRef.value.validate((valid) => {
    if (valid) {
      // 实际应调用API提交
      ElMessage.success('留言提交成功,我们会尽快联系您!')
      form.value = { name: '', phone: '', email: '', company: '', message: '' }
    }
  })
}
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

.contact-grid {
  display: grid;
  grid-template-columns: 2fr 1fr;
  gap: 50px;
  margin-bottom: 60px;
  
  @media (max-width: 768px) {
    grid-template-columns: 1fr;
  }
}

.contact-form-section,
.contact-info-section {
  h2 {
    font-size: 32px;
    color: #1a1a2e;
    margin-bottom: 30px;
  }
}

.contact-info-section {
  .info-item {
    display: flex;
    gap: 20px;
    margin-bottom: 30px;
    padding: 20px;
    background: #f5f7fa;
    border-radius: 8px;
    
    .info-icon {
      font-size: 32px;
    }
    
    h4 {
      font-size: 18px;
      color: #1a1a2e;
      margin-bottom: 5px;
    }
    
    p {
      font-size: 14px;
      color: #666;
    }
  }
}

.map-section {
  h2 {
    font-size: 32px;
    color: #1a1a2e;
    margin-bottom: 30px;
    text-align: center;
  }
}

.map-placeholder {
  height: 400px;
  background: #f5f7fa;
  border-radius: 8px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  
  p {
    font-size: 18px;
    color: #666;
    margin-bottom: 10px;
  }
  
  .map-note {
    font-size: 14px;
    color: #999;
  }
}
</style>
