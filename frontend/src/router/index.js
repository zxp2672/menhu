import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    name: 'Home',
    component: () => import('@/views/Home.vue')
  },
  {
    path: '/solutions',
    name: 'Solutions',
    component: () => import('@/views/Solutions.vue')
  },
  {
    path: '/solutions/:type',
    name: 'SolutionDetail',
    component: () => import('@/views/SolutionDetail.vue')
  },
  {
    path: '/technology',
    name: 'Technology',
    component: () => import('@/views/Technology.vue')
  },
  {
    path: '/cases',
    name: 'Cases',
    component: () => import('@/views/Cases.vue')
  },
  {
    path: '/cases/:id',
    name: 'CaseDetail',
    component: () => import('@/views/CaseDetail.vue')
  },
  {
    path: '/about',
    name: 'About',
    component: () => import('@/views/About.vue')
  },
  {
    path: '/contact',
    name: 'Contact',
    component: () => import('@/views/Contact.vue')
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
  scrollBehavior(to, from, savedPosition) {
    if (savedPosition) {
      return savedPosition
    } else {
      return { top: 0 }
    }
  }
})

export default router
