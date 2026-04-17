import { createStore } from 'vuex'

export default createStore({
  state: {
    siteConfig: {
      title: '成都天府志达科技有限公司',
      phone: '028-xxxx-xxxx',
      email: 'info@zhida-tech.com',
      address: '成都市武侯区复城国际T1写字楼1601'
    }
  },
  mutations: {
    UPDATE_SITE_CONFIG(state, config) {
      state.siteConfig = { ...state.siteConfig, ...config }
    }
  },
  actions: {
    fetchSiteConfig({ commit }) {
      // 从API获取网站配置
      // commit('UPDATE_SITE_CONFIG', config)
    }
  }
})
