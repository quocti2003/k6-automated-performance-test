-- Seed roles
INSERT INTO roles (id, name, description, active, created_at, updated_at) VALUES
(1, 'USER', 'Basic user role', true, NOW(), NOW()),
(2, 'ADMIN', 'Admin role', true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

-- Seed permissions
INSERT INTO permissions (id, name, description, resource, action, active, created_at, updated_at) VALUES
(1, 'USER_READ', 'Read user data', 'USER', 'READ', true, NOW(), NOW()),
(2, 'USER_MODIFY', 'Modify user data', 'USER', 'MODIFY', true, NOW(), NOW())
ON CONFLICT (id) DO NOTHING;

-- Assign permissions to USER role
INSERT INTO role_permissions (role_id, permission_id) VALUES (1, 1), (1, 2)
ON CONFLICT DO NOTHING;

-- Insert test user: standard.user / MimiMirror@123
-- BCrypt hash ($2b$12) generated from MimiMirror@123
INSERT INTO users (id, username, email, password, first_name, last_name, enabled, account_non_expired, account_non_locked, credentials_non_expired, failed_login_attempts, email_verified, created_at, updated_at)
VALUES (9999, 'standard.user', 'user@mirror.vn', '$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K', 'Standard', 'User', true, true, true, true, 0, true, NOW(), NOW())
ON CONFLICT (username) DO UPDATE SET password = '$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K', failed_login_attempts = 0;

-- Assign USER role to standard.user
INSERT INTO user_roles (user_id, role_id) VALUES (9999, 1)
ON CONFLICT DO NOTHING;
