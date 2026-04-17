const express = require('express');
const router = express.Router();
const caseController = require('../controllers/caseController');
const { authMiddleware } = require('../middleware/auth');

// 公开访问
router.get('/', caseController.getCases);
router.get('/:id', caseController.getCaseById);

// 需要认证
router.post('/', authMiddleware, caseController.createCase);
router.put('/:id', authMiddleware, caseController.updateCase);
router.delete('/:id', authMiddleware, caseController.deleteCase);

module.exports = router;
