<template>
  <el-container class="layout">
    <el-aside width="200px">
      <div class="logo">天府志达科技</div>
      <el-menu
        :default-active="route.path"
        router
        background-color="#1a1a2e"
        text-color="#fff"
        active-text-color="#00d4ff"
      >
        <el-menu-item index="/dashboard">
          <span>数据统计</span>
        </el-menu-item>
        <el-menu-item index="/cases">
          <span>案例管理</span>
        </el-menu-item>
        <el-menu-item index="/messages">
          <span>留言管理</span>
        </el-menu-item>
        <el-menu-item index="/solutions">
          <span>解决方案</span>
        </el-menu-item>
        <el-menu-item index="/settings">
          <span>系统设置</span>
        </el-menu-item>
      </el-menu>
    </el-aside>
    
    <el-container>
      <el-header>
        <div class="header-content">
          <span>后台管理系统</span>
          <el-button @click="handleLogout" type="danger" size="small">退出登录</el-button>
        </div>
      </el-header>
      
      <el-main>
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script setup>
import { useRoute, useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'

const route = useRoute()
const router = useRouter()

const handleLogout = () => {
  localStorage.removeItem('admin_token')
  ElMessage.success('已退出登录')
  router.push('/login')
}
</script>

<style scoped>
.layout {
  height: 100vh;
}

.el-aside {
  background: #1a1a2e;
}

.logo {
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #00d4ff;
  font-size: 18px;
  font-weight: bold;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.el-header {
  background: #fff;
  border-bottom: 1px solid #e4e7ed;
  display: flex;
  align-items: center;
}

.header-content {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 18px;
  font-weight: bold;
}

.el-main {
  background: #f5f7fa;
  padding: 20px;
}
</style>
