-- 创建数据库
CREATE DATABASE IF NOT EXISTS zhida_portal DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci;

-- 创建用户并授权
CREATE USER IF NOT EXISTS 'zhida_user'@'localhost' IDENTIFIED BY 'Zhida@2026!Secure';
GRANT ALL PRIVILEGES ON zhida_portal.* TO 'zhida_user'@'localhost';
FLUSH PRIVILEGES;

USE zhida_portal;

-- 管理员用户表
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  role ENUM('admin', 'editor') DEFAULT 'editor',
  status ENUM('active', 'inactive') DEFAULT 'active',
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL,
  INDEX idx_username (username),
  INDEX idx_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 案例表
CREATE TABLE IF NOT EXISTS cases (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  description TEXT NOT NULL,
  industry VARCHAR(50) NOT NULL,
  type ENUM('OA', 'ERP', 'CRM', 'CUSTOM') NOT NULL,
  content TEXT,
  images JSON,
  results JSON,
  status ENUM('draft', 'published') DEFAULT 'draft',
  sortOrder INT DEFAULT 0,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL,
  INDEX idx_type (type),
  INDEX idx_industry (industry),
  INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 留言表
CREATE TABLE IF NOT EXISTS messages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(100) NOT NULL,
  company VARCHAR(100),
  message TEXT NOT NULL,
  status ENUM('pending', 'processed', 'archived') DEFAULT 'pending',
  reply TEXT,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL,
  INDEX idx_status (status),
  INDEX idx_created (createdAt)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 解决方案表
CREATE TABLE IF NOT EXISTS solutions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type ENUM('oa', 'erp', 'crm', 'custom') NOT NULL UNIQUE,
  title VARCHAR(200) NOT NULL,
  description TEXT,
  content TEXT,
  features JSON,
  benefits JSON,
  images JSON,
  createdAt DATETIME NOT NULL,
  updatedAt DATETIME NOT NULL,
  INDEX idx_type (type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 插入初始解决方案数据
INSERT IGNORE INTO solutions (type, title, description, createdAt, updatedAt) VALUES
('oa', 'OA办公系统', '定制化流程审批、移动办公、协同管理', NOW(), NOW()),
('erp', 'ERP企业资源计划', '供应链管理、财务一体化、库存管控', NOW(), NOW()),
('crm', 'CRM客户关系管理', '销售漏斗管理、客户画像分析、精准营销', NOW(), NOW()),
('custom', '行业软件定制', '针对特定行业需求，提供专属软件定制开发服务', NOW(), NOW());
