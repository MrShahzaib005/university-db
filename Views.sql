use university_db;
-- View: Active Inventory Items with Supplier Info
CREATE OR REPLACE VIEW view_active_inventory AS
SELECT 
    i.name AS item_name,
    i.category,
    i.quantity,
    i.price,
    s.name AS supplier_name,
    s.contact
FROM inventory i
JOIN supplier s ON i.supplier_id = s.id
WHERE i.status = 1;

-- View: Active Complaints Assigned
CREATE OR REPLACE VIEW view_active_complaints AS
SELECT 
    title, type, assign_to, complaint_status, created_at
FROM complaints
WHERE complaint_status = 1 AND status = 1;

-- View: Gate Passes Issued Today
CREATE OR REPLACE VIEW view_today_gate_passes AS
SELECT 
    gp.name AS gate_pass_name,
    gp.issued_to,
    gp.issued_by,
    u.name AS approved_by,
    gp.issued_date
FROM gate_pass gp
JOIN card_ten_worker ctw ON gp.issued_by = ctw.id
JOIN users u ON ctw.approved_by = u.id
WHERE DATE(gp.issued_date) = CURDATE();
