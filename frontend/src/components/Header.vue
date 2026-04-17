<template>
  <header class="header" :class="{ 'scrolled': isScrolled }">
    <div class="container">
      <div class="header-content">
        <router-link to="/" class="logo">
          <img src="/images/logo.png" alt="天府志达科技" class="logo-img" />
          <span class="logo-text">天府志达科技</span>
        </router-link>
        
        <nav class="nav-menu" :class="{ 'mobile-open': mobileMenuOpen }">
          <router-link to="/" class="nav-item" @click="closeMobileMenu">首页</router-link>
          <router-link to="/solutions" class="nav-item" @click="closeMobileMenu">解决方案</router-link>
          <router-link to="/technology" class="nav-item" @click="closeMobileMenu">技术实力</router-link>
          <router-link to="/cases" class="nav-item" @click="closeMobileMenu">成功案例</router-link>
          <router-link to="/about" class="nav-item" @click="closeMobileMenu">关于我们</router-link>
          <router-link to="/contact" class="nav-item" @click="closeMobileMenu">联系我们</router-link>
        </nav>
        
        <div class="mobile-toggle" @click="toggleMobileMenu">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
  </header>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const isScrolled = ref(false)
const mobileMenuOpen = ref(false)

const handleScroll = () => {
  isScrolled.value = window.scrollY > 50
}

const toggleMobileMenu = () => {
  mobileMenuOpen.value = !mobileMenuOpen.value
}

const closeMobileMenu = () => {
  mobileMenuOpen.value = false
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped lang="scss">
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
  background: rgba(26, 26, 46, 0.95);
  backdrop-filter: blur(10px);
  transition: all 0.3s;
  
  &.scrolled {
    background: rgba(26, 26, 46, 0.98);
    box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
  }
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px 0;
}

.logo {
  display: flex;
  align-items: center;
  gap: 12px;
  text-decoration: none;
  
  .logo-img {
    height: 45px;
    width: auto;
    object-fit: contain;
  }
  
  .logo-text {
    font-size: 20px;
    font-weight: bold;
    color: #00d4ff;
    white-space: nowrap;
  }
}

.nav-menu {
  display: flex;
  gap: 30px;
  
  .nav-item {
    color: #fff;
    font-size: 15px;
    padding: 8px 0;
    position: relative;
    transition: color 0.3s;
    
    &:hover,
    &.router-link-active {
      color: #00d4ff;
    }
    
    &::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 0;
      height: 2px;
      background: #00d4ff;
      transition: width 0.3s;
    }
    
    &:hover::after,
    &.router-link-active::after {
      width: 100%;
    }
  }
}

.mobile-toggle {
  display: none;
  flex-direction: column;
  gap: 5px;
  cursor: pointer;
  
  span {
    width: 25px;
    height: 2px;
    background: #fff;
    transition: all 0.3s;
  }
}

@media (max-width: 768px) {
  .mobile-toggle {
    display: flex;
  }
  
  .nav-menu {
    position: fixed;
    top: 70px;
    left: 0;
    right: 0;
    background: rgba(26, 26, 46, 0.98);
    flex-direction: column;
    padding: 20px;
    gap: 0;
    transform: translateY(-100%);
    opacity: 0;
    transition: all 0.3s;
    pointer-events: none;
    
    &.mobile-open {
      transform: translateY(0);
      opacity: 1;
      pointer-events: all;
    }
    
    .nav-item {
      padding: 15px 0;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }
  }
}
</style>
