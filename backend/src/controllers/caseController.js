const Case = require('../models/Case');

// 获取案例列表
const getCases = async (req, res) => {
  try {
    const { page = 1, limit = 10, industry, type, status } = req.query;
    const where = {};
    
    if (industry) where.industry = industry;
    if (type) where.type = type;
    if (status) where.status = status;

    const { count, rows } = await Case.findAndCountAll({
      where,
      limit: parseInt(limit),
      offset: (parseInt(page) - 1) * parseInt(limit),
      order: [['sortOrder', 'DESC'], ['createdAt', 'DESC']]
    });

    res.json({
      data: rows,
      total: count,
      page: parseInt(page),
      pages: Math.ceil(count / parseInt(limit))
    });
  } catch (error) {
    res.status(500).json({ message: '服务器错误', error: error.message });
  }
};

// 获取案例详情
const getCaseById = async (req, res) => {
  try {
    const caseItem = await Case.findByPk(req.params.id);
    if (!caseItem) {
      return res.status(404).json({ message: '案例不存在' });
    }
    res.json(caseItem);
  } catch (error) {
    res.status(500).json({ message: '服务器错误', error: error.message });
  }
};

// 创建案例
const createCase = async (req, res) => {
  try {
    const caseItem = await Case.create(req.body);
    res.status(201).json({ message: '创建成功', data: caseItem });
  } catch (error) {
    res.status(500).json({ message: '服务器错误', error: error.message });
  }
};

// 更新案例
const updateCase = async (req, res) => {
  try {
    const caseItem = await Case.findByPk(req.params.id);
    if (!caseItem) {
      return res.status(404).json({ message: '案例不存在' });
    }
    
    await caseItem.update(req.body);
    res.json({ message: '更新成功', data: caseItem });
  } catch (error) {
    res.status(500).json({ message: '服务器错误', error: error.message });
  }
};

// 删除案例
const deleteCase = async (req, res) => {
  try {
    const caseItem = await Case.findByPk(req.params.id);
    if (!caseItem) {
      return res.status(404).json({ message: '案例不存在' });
    }
    
    await caseItem.destroy();
    res.json({ message: '删除成功' });
  } catch (error) {
    res.status(500).json({ message: '服务器错误', error: error.message });
  }
};

module.exports = { getCases, getCaseById, createCase, updateCase, deleteCase };
