const express = require('express');
const router = express.Router();
const messageController = require('../controllers/messageController');
const { authMiddleware } = require('../middleware/auth');

// 公开访问 - 提交留言
router.post('/', messageController.submitMessage);

// 需要认证 - 管理留言
router.get('/', authMiddleware, messageController.getMessages);
router.put('/:id/status', authMiddleware, messageController.updateMessageStatus);

module.exports = router;
