-- auditoria_triggers.sql
-- Crear función y trigger único para auditoría de la tabla muertes_accidentes

-- 1) Crear / reemplazar función
CREATE OR REPLACE FUNCTION registrar_auditoria_accidente()
RETURNS TRIGGER AS $$
DECLARE
    v_old JSONB;
    v_new JSONB;
    v_accion VARCHAR(50);
    v_id_accidente INT;
    v_id_usuario INT;
BEGIN
    IF TG_OP = 'INSERT' THEN
        v_accion := 'INSERT';
        v_new := TO_JSONB(NEW);
        v_old := NULL;
        v_id_accidente := NEW.id;
        v_id_usuario := NULL; -- no hay contexto de usuario en trigger

    ELSIF TG_OP = 'UPDATE' THEN
        v_accion := 'UPDATE';
        v_old := TO_JSONB(OLD);
        v_new := TO_JSONB(NEW);
        v_id_accidente := NEW.id;
        v_id_usuario := NULL;

    ELSIF TG_OP = 'DELETE' THEN
        v_accion := 'DELETE';
        v_old := TO_JSONB(OLD);
        v_new := NULL;
        v_id_accidente := OLD.id;
        v_id_usuario := NULL;
    END IF;

    INSERT INTO auditoria_accidentes (
        id_muertes_accidente,
        id_usuario,
        accion,
        fecha_creacion,
        datos_anteriores,
        datos_nuevos
    )
    VALUES (
        v_id_accidente,
        v_id_usuario,
        v_accion,
        NOW(),
        v_old,
        v_new
    );

    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    ELSE
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;


-- 2) Crear trigger único (AFTER INSERT OR UPDATE OR DELETE)
DROP TRIGGER IF EXISTS trg_auditar_accidente ON muertes_accidentes;

CREATE TRIGGER trg_auditar_accidente
AFTER INSERT OR UPDATE OR DELETE ON muertes_accidentes
FOR EACH ROW
EXECUTE FUNCTION registrar_auditoria_accidente();

