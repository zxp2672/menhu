const Message = require('../models/Message');

// 提交留言(前端网站)
const submitMessage = async (req, res) => {
  try {
    const message = await Message.create(req.body);
    res.status(201).json({ message: '提交成功', data: message });
  } catch (error) {
    res.status(500).json({ message: '服务器错误', error: error.message });
  }
};

// 获取留言列表(后台管理)
const getMessages = async (req, res) => {
  try {
    const { page = 1, limit = 20, status } = req.query;
    const where = {};
    
    if (status) where.status = status;

    const { count, rows } = await Message.findAndCountAll({
      where,
      limit: parseInt(limit),
      offset: (parseInt(page) - 1) * parseInt(limit),
      order: [['createdAt', 'DESC']]
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

// 更新留言状态
const updateMessageStatus = async (req, res) => {
  try {
    const message = await Message.findByPk(req.params.id);
    if (!message) {
      return res.status(404).json({ message: '留言不存在' });
    }
    
    await message.update(req.body);
    res.json({ message: '更新成功', data: message });
  } catch (error) {
    res.status(500).json({ message: '服务器错误', error: error.message });
  }
};

module.exports = { submitMessage, getMessages, updateMessageStatus };
