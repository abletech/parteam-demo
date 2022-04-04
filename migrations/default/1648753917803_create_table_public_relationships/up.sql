CREATE TABLE "public"."relationships" ("id" uuid NOT NULL DEFAULT gen_random_uuid(), "from_party_id" uuid NOT NULL, "to_party_id" uuid NOT NULL, "relationship_type" text NOT NULL, "created_at" timestamptz NOT NULL DEFAULT now(), "updated_at" timestamptz NOT NULL DEFAULT now(), PRIMARY KEY ("id") , FOREIGN KEY ("from_party_id") REFERENCES "public"."parties"("id") ON UPDATE cascade ON DELETE restrict, FOREIGN KEY ("to_party_id") REFERENCES "public"."parties"("id") ON UPDATE cascade ON DELETE restrict, FOREIGN KEY ("relationship_type") REFERENCES "public"."relationship_types"("identifier") ON UPDATE cascade ON DELETE restrict);
CREATE OR REPLACE FUNCTION "public"."set_current_timestamp_updated_at"()
RETURNS TRIGGER AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER "set_public_relationships_updated_at"
BEFORE UPDATE ON "public"."relationships"
FOR EACH ROW
EXECUTE PROCEDURE "public"."set_current_timestamp_updated_at"();
COMMENT ON TRIGGER "set_public_relationships_updated_at" ON "public"."relationships" 
IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE EXTENSION IF NOT EXISTS pgcrypto;
