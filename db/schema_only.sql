--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: age_group_preference_values; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.age_group_preference_values (
    preference_id uuid NOT NULL,
    preferred_value character varying(255)
);


--
-- Name: age_group_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.age_group_preferences (
    id uuid NOT NULL,
    age_group_id uuid NOT NULL,
    attribute_type character varying(100) NOT NULL,
    weight integer NOT NULL
);


--
-- Name: age_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.age_groups (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    min_age integer,
    max_age integer
);


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.appointments (
    id character varying(255) NOT NULL,
    customer_title character varying(20),
    customer_first_name character varying(100) NOT NULL,
    customer_last_name character varying(100) NOT NULL,
    customer_email character varying(255),
    customer_phone character varying(50) NOT NULL,
    venue_id character varying(30) NOT NULL,
    service character varying(100),
    appointment_date date NOT NULL,
    appointment_time time without time zone NOT NULL,
    language character varying(20) DEFAULT 'en'::character varying,
    preferences text,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    cancellation_reason text,
    staff_notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN appointments.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.id IS 'Primary key (APT prefix)';


--
-- Name: COLUMN appointments.customer_title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.customer_title IS 'Customer title (Mr, Mrs, Ms)';


--
-- Name: COLUMN appointments.customer_first_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.customer_first_name IS 'Customer first name';


--
-- Name: COLUMN appointments.customer_last_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.customer_last_name IS 'Customer last name';


--
-- Name: COLUMN appointments.customer_email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.customer_email IS 'Customer email address';


--
-- Name: COLUMN appointments.customer_phone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.customer_phone IS 'Customer phone number';


--
-- Name: COLUMN appointments.venue_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.venue_id IS 'Reference to locations table';


--
-- Name: COLUMN appointments.service; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.service IS 'Type of service requested';


--
-- Name: COLUMN appointments.appointment_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.appointment_date IS 'Date of appointment';


--
-- Name: COLUMN appointments.appointment_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.appointment_time IS 'Time of appointment';


--
-- Name: COLUMN appointments.language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.language IS 'Preferred language';


--
-- Name: COLUMN appointments.preferences; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.preferences IS 'Customer preferences and special requests';


--
-- Name: COLUMN appointments.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.status IS 'Appointment status (PENDING, CONFIRMED, COMPLETED, CANCELLED, NO_SHOW)';


--
-- Name: COLUMN appointments.cancellation_reason; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.cancellation_reason IS 'Reason for cancellation if cancelled';


--
-- Name: COLUMN appointments.staff_notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.staff_notes IS 'Internal staff notes';


--
-- Name: COLUMN appointments.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.created_at IS 'Creation timestamp';


--
-- Name: COLUMN appointments.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN appointments.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN appointments.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.appointments.is_active IS 'Active status flag';


--
-- Name: apt_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.apt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.audit_logs (
    id bigint NOT NULL,
    username character varying(50),
    action character varying(100) NOT NULL,
    resource character varying(255),
    ip_address character varying(45),
    user_agent character varying(500),
    details text,
    success boolean NOT NULL,
    error_message character varying(500),
    "timestamp" timestamp without time zone DEFAULT now() NOT NULL,
    session_id character varying(100)
);


--
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.audit_logs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.audit_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: band_style_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.band_style_options (
    id bigint NOT NULL,
    style_code character varying(50) NOT NULL,
    style_name character varying(100) NOT NULL,
    description character varying(255),
    image character varying(255),
    price integer DEFAULT 0,
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: band_style_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.band_style_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.band_style_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: blk_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blk_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blocked_slots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blocked_slots (
    id character varying(255) NOT NULL,
    venue_id character varying(30),
    block_date date NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone,
    is_full_day boolean DEFAULT false NOT NULL,
    reason character varying(255),
    block_type character varying(20) DEFAULT 'SINGLE'::character varying NOT NULL,
    recurring_end_date date,
    created_by character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN blocked_slots.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.id IS 'Primary key (BLK prefix)';


--
-- Name: COLUMN blocked_slots.venue_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.venue_id IS 'Reference to locations table (null = all venues)';


--
-- Name: COLUMN blocked_slots.block_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.block_date IS 'Date of the blocked slot';


--
-- Name: COLUMN blocked_slots.start_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.start_time IS 'Start time of blocked period';


--
-- Name: COLUMN blocked_slots.end_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.end_time IS 'End time of blocked period (null = single slot)';


--
-- Name: COLUMN blocked_slots.is_full_day; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.is_full_day IS 'Whether the entire day is blocked';


--
-- Name: COLUMN blocked_slots.reason; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.reason IS 'Reason for blocking (e.g., Lunch break, Meeting, Holiday)';


--
-- Name: COLUMN blocked_slots.block_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.block_type IS 'Type of block (SINGLE, RECURRING_DAILY, RECURRING_WEEKLY)';


--
-- Name: COLUMN blocked_slots.recurring_end_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.recurring_end_date IS 'End date for recurring blocks';


--
-- Name: COLUMN blocked_slots.created_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.created_by IS 'Admin user who created the block';


--
-- Name: COLUMN blocked_slots.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.created_at IS 'Creation timestamp';


--
-- Name: COLUMN blocked_slots.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN blocked_slots.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN blocked_slots.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.blocked_slots.is_active IS 'Active status flag';


--
-- Name: cat_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: category_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cer_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: certificate_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.certificate_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: certificates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.certificates (
    id character varying(255) NOT NULL,
    certificate_code character varying(255) NOT NULL,
    certificate_type character varying(50) NOT NULL,
    certificate_url character varying(500),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN certificates.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.certificates.id IS 'Primary key (CER prefix)';


--
-- Name: COLUMN certificates.certificate_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.certificates.certificate_code IS 'Certificate identification code';


--
-- Name: COLUMN certificates.certificate_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.certificates.certificate_type IS 'Type of certificate (IGI, etc.)';


--
-- Name: COLUMN certificates.certificate_url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.certificates.certificate_url IS 'URL to certificate document';


--
-- Name: COLUMN certificates.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.certificates.created_at IS 'Creation timestamp';


--
-- Name: COLUMN certificates.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.certificates.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN certificates.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.certificates.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN certificates.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.certificates.is_active IS 'Active status flag';


--
-- Name: clarity_grade_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clarity_grade_options (
    id bigint NOT NULL,
    clarity_code character varying(20) NOT NULL,
    clarity_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: clarity_grade_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.clarity_grade_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.clarity_grade_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: col_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.col_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: collection_age_group_allocations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection_age_group_allocations (
    id uuid NOT NULL,
    collection_plan_id uuid NOT NULL,
    age_group_id uuid NOT NULL,
    allocation_percentage integer NOT NULL,
    target_quantity integer NOT NULL
);


--
-- Name: collection_plan_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection_plan_items (
    id uuid NOT NULL,
    collection_plan_id uuid NOT NULL,
    product_name character varying(255) NOT NULL,
    product_type character varying(255) NOT NULL,
    base_design character varying(255),
    target_quantity integer NOT NULL,
    estimated_unit_cost numeric(10,2),
    jewelry_spec_id character varying(255)
);


--
-- Name: collection_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection_plans (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    total_quantity integer NOT NULL,
    deadline date,
    status character varying(50) NOT NULL,
    total_cost numeric(12,2),
    estimated_delivery_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: collection_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collection_products (
    id character varying(255) NOT NULL,
    collection_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    sort_order integer DEFAULT 0,
    is_hero_product boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL
);


--
-- Name: COLUMN collection_products.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collection_products.id IS 'Primary key';


--
-- Name: COLUMN collection_products.collection_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collection_products.collection_id IS 'Foreign key to collections';


--
-- Name: COLUMN collection_products.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collection_products.product_id IS 'Foreign key to products';


--
-- Name: COLUMN collection_products.sort_order; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collection_products.sort_order IS 'Product order in collection';


--
-- Name: COLUMN collection_products.is_hero_product; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collection_products.is_hero_product IS 'Is this the hero product';


--
-- Name: COLUMN collection_products.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collection_products.created_at IS 'Creation timestamp';


--
-- Name: COLUMN collection_products.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collection_products.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN collection_products.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collection_products.is_active IS 'Is active flag';


--
-- Name: COLUMN collection_products.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collection_products.is_deleted IS 'Is deleted flag';


--
-- Name: collections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.collections (
    id character varying(255) NOT NULL,
    name character varying(500) NOT NULL,
    title character varying(500) NOT NULL,
    description text,
    season character varying(50),
    year integer,
    theme character varying(200),
    image_url character varying(1000),
    banner_image_url character varying(1000),
    image_urls text,
    status character varying(20) DEFAULT 'ACTIVE'::character varying NOT NULL,
    featured boolean DEFAULT false,
    sort_order integer DEFAULT 0,
    start_date date,
    end_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN collections.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.id IS 'Primary key';


--
-- Name: COLUMN collections.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.name IS 'Collection name';


--
-- Name: COLUMN collections.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.title IS 'Display title';


--
-- Name: COLUMN collections.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.description IS 'Collection description';


--
-- Name: COLUMN collections.season; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.season IS 'Target season';


--
-- Name: COLUMN collections.year; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.year IS 'Collection year';


--
-- Name: COLUMN collections.theme; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.theme IS 'Collection theme';


--
-- Name: COLUMN collections.image_url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.image_url IS 'Main collection image';


--
-- Name: COLUMN collections.banner_image_url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.banner_image_url IS 'Banner/hero image';


--
-- Name: COLUMN collections.image_urls; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.image_urls IS 'Additional images (JSON array)';


--
-- Name: COLUMN collections.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.status IS 'Collection status';


--
-- Name: COLUMN collections.featured; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.featured IS 'Is featured collection';


--
-- Name: COLUMN collections.sort_order; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.sort_order IS 'Display order';


--
-- Name: COLUMN collections.start_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.start_date IS 'Collection launch date';


--
-- Name: COLUMN collections.end_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.end_date IS 'Collection end date';


--
-- Name: COLUMN collections.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.created_at IS 'Creation timestamp';


--
-- Name: COLUMN collections.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.collections.updated_at IS 'Last update timestamp';


--
-- Name: color_grade_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.color_grade_options (
    id bigint NOT NULL,
    grade_code character varying(20) NOT NULL,
    grade_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: color_grade_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.color_grade_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.color_grade_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: com_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.com_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: component_optional_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.component_optional_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: component_optionals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.component_optionals (
    id character varying(255) NOT NULL,
    component_optional_name character varying(255) NOT NULL,
    description text,
    component_id character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: component_ownership_log_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.component_ownership_log_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: component_ownership_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.component_ownership_logs (
    id character varying(36) NOT NULL,
    production_order_id character varying(36) NOT NULL,
    stage_id character varying(36),
    from_vendor_id character varying(36),
    to_vendor_id character varying(36),
    handoff_type character varying(30) NOT NULL,
    status character varying(20) DEFAULT 'INITIATED'::character varying NOT NULL,
    initiated_by character varying(100) NOT NULL,
    initiated_at timestamp without time zone NOT NULL,
    received_by character varying(100),
    received_at timestamp without time zone,
    expected_arrival_date date,
    tracking_number character varying(100),
    shipping_carrier character varying(100),
    reason character varying(500),
    notes text,
    rejection_reason character varying(500),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT chk_col_handoff_type CHECK (((handoff_type)::text = ANY (ARRAY[('INITIAL_ASSIGNMENT'::character varying)::text, ('STAGE_START'::character varying)::text, ('STAGE_COMPLETE'::character varying)::text, ('VENDOR_REASSIGN'::character varying)::text, ('RETURN_TO_MIRROR'::character varying)::text, ('REWORK_RETURN'::character varying)::text]))),
    CONSTRAINT chk_col_status CHECK (((status)::text = ANY (ARRAY[('INITIATED'::character varying)::text, ('IN_TRANSIT'::character varying)::text, ('RECEIVED'::character varying)::text, ('REJECTED'::character varying)::text, ('CANCELLED'::character varying)::text])))
);


--
-- Name: component_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.component_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: components; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.components (
    id character varying(255) NOT NULL,
    component_name character varying(255) NOT NULL,
    description text,
    product_id character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: country_of_origin_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country_of_origin_options (
    id bigint NOT NULL,
    country_code character varying(10) NOT NULL,
    country_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: country_of_origin_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.country_of_origin_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.country_of_origin_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cpr_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cpr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- Name: des_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.des_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: design_product_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.design_product_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: design_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.design_products (
    id character varying(255) NOT NULL,
    designer_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    commission_percentage numeric(5,2),
    loyalty_percentage numeric(5,2),
    design_name character varying(200),
    design_description text,
    design_concept text,
    design_inspiration character varying(500),
    design_created_date timestamp without time zone,
    product_conversion_date timestamp without time zone,
    total_sales_count integer DEFAULT 0,
    total_sales_amount numeric(15,2) DEFAULT 0.00,
    total_commission_earned numeric(15,2) DEFAULT 0.00,
    total_loyalty_earned numeric(15,2) DEFAULT 0.00,
    design_status character varying(50) DEFAULT 'ACTIVE'::character varying,
    featured_design boolean DEFAULT false,
    average_rating numeric(3,2),
    review_count integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: design_sale_transaction_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.design_sale_transaction_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: design_sale_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.design_sale_transactions (
    id character varying(255) NOT NULL,
    design_product_id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    sale_amount numeric(15,2) NOT NULL,
    commission_amount numeric(15,2) DEFAULT 0.00,
    loyalty_amount numeric(15,2) DEFAULT 0.00,
    commission_percentage numeric(5,2) DEFAULT 0.00,
    loyalty_percentage numeric(5,2) DEFAULT 0.00,
    currency character varying(3) DEFAULT 'VND'::character varying NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    sale_date timestamp without time zone NOT NULL,
    processed boolean DEFAULT false NOT NULL,
    customer_rating numeric(3,2),
    customer_review text,
    is_active boolean DEFAULT true NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: designer_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.designer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: designers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.designers (
    id character varying(255) NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(200) NOT NULL,
    owner_user_id character varying(255),
    brand_name character varying(200),
    specialty character varying(200),
    years_experience integer,
    design_style character varying(100),
    default_commission_percent numeric(5,2),
    default_loyalty_percent numeric(5,2),
    total_designs_created integer DEFAULT 0,
    total_products_sold integer DEFAULT 0,
    total_earnings numeric(15,2) DEFAULT 0.00,
    join_date timestamp without time zone,
    last_design_date timestamp without time zone,
    contact_email character varying(200),
    contact_phone character varying(50),
    website character varying(500),
    social_media_links text,
    bio text,
    portfolio_url character varying(500),
    verified boolean DEFAULT false NOT NULL,
    featured boolean DEFAULT false NOT NULL,
    rating numeric(3,2),
    review_count integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: dpr_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dpr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dst_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dst_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_verification_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_verification_tokens (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    token character varying(255) NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    verified_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: email_verification_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.email_verification_tokens ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.email_verification_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: fil_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: file_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.file_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hol_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: id_sequences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.id_sequences (
    entity_type character varying(50) NOT NULL,
    current_value bigint DEFAULT 0 NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: inp_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.inp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: inventory_movements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_movements (
    id character varying(255) NOT NULL,
    inventory_id character varying(255) NOT NULL,
    partner_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    movement_type character varying(30) NOT NULL,
    quantity integer NOT NULL,
    quantity_before integer NOT NULL,
    quantity_after integer NOT NULL,
    reference_id character varying(255),
    reference_type character varying(30),
    notes text,
    created_by character varying(100),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN inventory_movements.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.id IS 'Primary key (IVM prefix)';


--
-- Name: COLUMN inventory_movements.inventory_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.inventory_id IS 'Reference to partner_inventory';


--
-- Name: COLUMN inventory_movements.partner_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.partner_id IS 'Reference to pod_partners (denormalized)';


--
-- Name: COLUMN inventory_movements.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.product_id IS 'Reference to mirror_products (denormalized)';


--
-- Name: COLUMN inventory_movements.movement_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.movement_type IS 'WHOLESALE_IN, SALE_OUT, ADJUSTMENT_IN, ADJUSTMENT_OUT, RETURN_IN, TRANSFER_OUT, DAMAGED_OUT';


--
-- Name: COLUMN inventory_movements.quantity; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.quantity IS 'Quantity moved';


--
-- Name: COLUMN inventory_movements.quantity_before; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.quantity_before IS 'Stock before movement';


--
-- Name: COLUMN inventory_movements.quantity_after; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.quantity_after IS 'Stock after movement';


--
-- Name: COLUMN inventory_movements.reference_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.reference_id IS 'Reference to wholesale_order or partner_sale ID';


--
-- Name: COLUMN inventory_movements.reference_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.reference_type IS 'WHOLESALE_ORDER or PARTNER_SALE';


--
-- Name: COLUMN inventory_movements.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.notes IS 'Movement notes';


--
-- Name: COLUMN inventory_movements.created_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.created_by IS 'User who created the movement';


--
-- Name: COLUMN inventory_movements.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.created_at IS 'Creation timestamp';


--
-- Name: COLUMN inventory_movements.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN inventory_movements.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN inventory_movements.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_movements.is_active IS 'Active status flag';


--
-- Name: inventory_position_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_position_history (
    id character varying(255) NOT NULL,
    position_id character varying(255) NOT NULL,
    product_code character varying(30) NOT NULL,
    action_type character varying(30) NOT NULL,
    from_warehouse_id character varying(255),
    from_warehouse_name character varying(255),
    from_rack_id character varying(255),
    from_rack_code character varying(50),
    from_slot_id character varying(255),
    from_slot_code character varying(50),
    to_warehouse_id character varying(255),
    to_warehouse_name character varying(255),
    to_rack_id character varying(255),
    to_rack_code character varying(50),
    to_slot_id character varying(255),
    to_slot_code character varying(50),
    from_status character varying(30),
    to_status character varying(30),
    quantity_before integer,
    quantity_after integer,
    reference_type character varying(50),
    reference_id character varying(255),
    performed_by character varying(255) NOT NULL,
    performed_by_name character varying(255),
    performed_at timestamp without time zone NOT NULL,
    reason text,
    notes text,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: COLUMN inventory_position_history.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.id IS 'Primary key (IPH prefix)';


--
-- Name: COLUMN inventory_position_history.position_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.position_id IS 'FK to inventory_positions';


--
-- Name: COLUMN inventory_position_history.product_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.product_code IS 'SKU code (denormalized for query performance)';


--
-- Name: COLUMN inventory_position_history.action_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.action_type IS 'Action: PLACED, MOVED, REMOVED, STATUS_CHANGED, VERIFIED';


--
-- Name: COLUMN inventory_position_history.from_warehouse_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.from_warehouse_id IS 'Previous warehouse';


--
-- Name: COLUMN inventory_position_history.from_warehouse_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.from_warehouse_name IS 'Previous warehouse name (denormalized)';


--
-- Name: COLUMN inventory_position_history.from_rack_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.from_rack_id IS 'Previous rack';


--
-- Name: COLUMN inventory_position_history.from_rack_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.from_rack_code IS 'Previous rack code (denormalized)';


--
-- Name: COLUMN inventory_position_history.from_slot_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.from_slot_id IS 'Previous slot';


--
-- Name: COLUMN inventory_position_history.from_slot_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.from_slot_code IS 'Previous slot code (denormalized)';


--
-- Name: COLUMN inventory_position_history.to_warehouse_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.to_warehouse_id IS 'New warehouse';


--
-- Name: COLUMN inventory_position_history.to_warehouse_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.to_warehouse_name IS 'New warehouse name (denormalized)';


--
-- Name: COLUMN inventory_position_history.to_rack_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.to_rack_id IS 'New rack';


--
-- Name: COLUMN inventory_position_history.to_rack_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.to_rack_code IS 'New rack code (denormalized)';


--
-- Name: COLUMN inventory_position_history.to_slot_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.to_slot_id IS 'New slot';


--
-- Name: COLUMN inventory_position_history.to_slot_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.to_slot_code IS 'New slot code (denormalized)';


--
-- Name: COLUMN inventory_position_history.from_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.from_status IS 'Previous position status';


--
-- Name: COLUMN inventory_position_history.to_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.to_status IS 'New position status';


--
-- Name: COLUMN inventory_position_history.quantity_before; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.quantity_before IS 'Quantity before change';


--
-- Name: COLUMN inventory_position_history.quantity_after; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.quantity_after IS 'Quantity after change';


--
-- Name: COLUMN inventory_position_history.reference_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.reference_type IS 'Source: STOCK_INWARD, TRANSFER, ADJUSTMENT, RECONCILIATION, MANUAL';


--
-- Name: COLUMN inventory_position_history.reference_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.reference_id IS 'Reference document ID';


--
-- Name: COLUMN inventory_position_history.performed_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.performed_by IS 'User ID who performed the action';


--
-- Name: COLUMN inventory_position_history.performed_by_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.performed_by_name IS 'User name (denormalized)';


--
-- Name: COLUMN inventory_position_history.performed_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.performed_at IS 'When the action was performed';


--
-- Name: COLUMN inventory_position_history.reason; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.reason IS 'Reason for the change';


--
-- Name: COLUMN inventory_position_history.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.notes IS 'Additional notes';


--
-- Name: COLUMN inventory_position_history.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_position_history.created_at IS 'Record creation timestamp';


--
-- Name: inventory_positions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.inventory_positions (
    id character varying(255) NOT NULL,
    product_code character varying(30) NOT NULL,
    warehouse_id character varying(255),
    rack_id character varying(255),
    slot_id character varying(255),
    quantity integer DEFAULT 0 NOT NULL,
    position_status character varying(30) NOT NULL,
    assigned_at timestamp without time zone,
    assigned_by character varying(255),
    last_verified_at timestamp without time zone,
    last_verified_by character varying(255),
    reference_type character varying(50),
    reference_id character varying(255),
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN inventory_positions.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.id IS 'Primary key (INP prefix)';


--
-- Name: COLUMN inventory_positions.product_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.product_code IS 'SKU code from mirror_products';


--
-- Name: COLUMN inventory_positions.warehouse_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.warehouse_id IS 'FK to locations (WAREHOUSE type) - required when qty > 0';


--
-- Name: COLUMN inventory_positions.rack_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.rack_id IS 'FK to warehouse_racks - optional';


--
-- Name: COLUMN inventory_positions.slot_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.slot_id IS 'FK to warehouse_slots - optional but recommended';


--
-- Name: COLUMN inventory_positions.quantity; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.quantity IS 'Quantity at this position';


--
-- Name: COLUMN inventory_positions.position_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.position_status IS 'Status: PLACED, PENDING_PLACEMENT, UNASSIGNED, IN_TRANSIT';


--
-- Name: COLUMN inventory_positions.assigned_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.assigned_at IS 'When item was assigned to this position';


--
-- Name: COLUMN inventory_positions.assigned_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.assigned_by IS 'User ID who assigned the position';


--
-- Name: COLUMN inventory_positions.last_verified_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.last_verified_at IS 'Last physical verification timestamp';


--
-- Name: COLUMN inventory_positions.last_verified_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.last_verified_by IS 'User ID who last verified';


--
-- Name: COLUMN inventory_positions.reference_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.reference_type IS 'Source: STOCK_INWARD, TRANSFER, ADJUSTMENT, RECONCILIATION';


--
-- Name: COLUMN inventory_positions.reference_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.reference_id IS 'Reference document ID';


--
-- Name: COLUMN inventory_positions.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.notes IS 'Additional notes';


--
-- Name: COLUMN inventory_positions.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.created_at IS 'Creation timestamp';


--
-- Name: COLUMN inventory_positions.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN inventory_positions.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN inventory_positions.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.inventory_positions.is_active IS 'Active status flag';


--
-- Name: iph_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.iph_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: itc_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.itc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_variant_config_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_variant_config_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_variant_configs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_variant_configs (
    id character varying(255) NOT NULL,
    item_variant_id character varying(255) NOT NULL,
    component_optional_id character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: item_variant_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.item_variant_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.item_variants (
    id character varying(255) NOT NULL,
    item_variant_url character varying(500) NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: itv_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.itv_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ivm_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ivm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jewelry_technical_reports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jewelry_technical_reports (
    id character varying(36) NOT NULL,
    report_number character varying(50) NOT NULL,
    collection_plan_item_id character varying(36),
    product_id character varying(36),
    status character varying(20) NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    collection character varying(100) NOT NULL,
    season character varying(20) NOT NULL,
    project_id character varying(50),
    category character varying(50) NOT NULL,
    source character varying(100),
    entry_date date,
    gold_price_per_gram numeric(15,2),
    exchange_rate_usd numeric(15,2),
    total_metal_cost numeric(15,2),
    total_stone_cost numeric(15,2),
    total_labor_cost numeric(15,2),
    total_cogs_vnd numeric(15,2),
    total_cogs_usd numeric(15,2),
    production_difficulty integer,
    estimated_lead_time_days integer,
    casting_status character varying(50),
    production_notes text,
    render_3d_url character varying(500),
    stone_map_url character varying(500),
    technical_drawing_url character varying(500),
    created_by character varying(100),
    updated_by character varying(100),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    rejection_reason text,
    render_3d_urls text,
    stone_map_urls text,
    technical_drawing_urls text,
    CONSTRAINT chk_jtrc_difficulty CHECK (((production_difficulty IS NULL) OR ((production_difficulty >= 1) AND (production_difficulty <= 5))))
);


--
-- Name: jlc_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jlc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jmc_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jmc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jsc_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jsc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jtr_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jtr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jtrc_labor_component_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jtrc_labor_component_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jtrc_labor_components; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jtrc_labor_components (
    id character varying(36) NOT NULL,
    jtrc_id character varying(36) NOT NULL,
    labor_type character varying(20) NOT NULL,
    description character varying(500),
    cost numeric(15,2) NOT NULL,
    notes text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: jtrc_metal_component_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jtrc_metal_component_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jtrc_metal_components; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jtrc_metal_components (
    id character varying(36) NOT NULL,
    jtrc_id character varying(36) NOT NULL,
    metal_type character varying(50) NOT NULL,
    metal_purity character varying(20) NOT NULL,
    weight_grams numeric(10,3) NOT NULL,
    loss_rate_percent numeric(5,2),
    price_per_gram numeric(15,2),
    metal_cost numeric(15,2),
    loss_cost numeric(15,2),
    total_cost numeric(15,2),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: jtrc_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jtrc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jtrc_stone_component_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jtrc_stone_component_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jtrc_stone_components; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jtrc_stone_components (
    id character varying(36) NOT NULL,
    jtrc_id character varying(36) NOT NULL,
    stone_role character varying(20) NOT NULL,
    stone_type character varying(100) NOT NULL,
    stone_detail character varying(200),
    shape character varying(50) NOT NULL,
    color_category character varying(20) NOT NULL,
    color_grade character varying(10),
    color_intensity character varying(50),
    color_name character varying(50),
    clarity character varying(20),
    size_mm character varying(50),
    weight_carat numeric(10,3),
    quantity integer DEFAULT 1 NOT NULL,
    unit_price numeric(15,2),
    total_price numeric(15,2),
    notes text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: label_template_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.label_template_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: label_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.label_templates (
    id character varying(50) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    dpi integer DEFAULT 300 NOT NULL,
    preview_url character varying(500),
    is_default boolean DEFAULT false NOT NULL,
    status character varying(50) DEFAULT 'ACTIVE'::character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(50),
    updated_by character varying(50),
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    label_type character varying(50) DEFAULT 'JEWELRY_TAG'::character varying NOT NULL,
    width_mm integer,
    height_mm integer,
    variables text,
    preview_image_url character varying(500),
    zpl_content text DEFAULT '^XA^XZ'::text NOT NULL,
    canvas_json jsonb DEFAULT '{}'::jsonb NOT NULL,
    label_width numeric(10,2) DEFAULT 30 NOT NULL,
    label_height numeric(10,2) DEFAULT 70 NOT NULL,
    CONSTRAINT chk_lbt_dpi_positive CHECK ((dpi > 0)),
    CONSTRAINT chk_lbt_height_positive CHECK (((height_mm IS NULL) OR (height_mm > 0))),
    CONSTRAINT chk_lbt_label_type CHECK (((label_type)::text = ANY (ARRAY[('JEWELRY_TAG'::character varying)::text, ('BUTTERFLY_TAG'::character varying)::text, ('PRODUCT_LABEL'::character varying)::text, ('QR_CODE'::character varying)::text, ('BARCODE'::character varying)::text, ('PRICE_TAG'::character varying)::text]))),
    CONSTRAINT chk_lbt_width_positive CHECK (((width_mm IS NULL) OR (width_mm > 0)))
);


--
-- Name: labor_type_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.labor_type_options (
    id bigint NOT NULL,
    labor_code character varying(20) NOT NULL,
    labor_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: labor_type_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.labor_type_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.labor_type_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: lbt_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lbt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: loc_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.loc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.locations (
    id character varying(255) NOT NULL,
    name character varying(500) NOT NULL,
    type character varying(100) NOT NULL,
    address text NOT NULL,
    city character varying(255) NOT NULL,
    latitude numeric(10,7) NOT NULL,
    longitude numeric(10,7) NOT NULL,
    hours character varying(255) NOT NULL,
    phone character varying(50) NOT NULL,
    status character varying(20) DEFAULT 'ACTIVE'::character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    misa_warehouse_id character varying(100),
    misa_warehouse_code character varying(50),
    is_internal boolean DEFAULT false NOT NULL,
    capacity integer,
    manager_name character varying(255),
    manager_phone character varying(50),
    misa_last_synced_at timestamp without time zone
);


--
-- Name: COLUMN locations.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.id IS 'Primary key';


--
-- Name: COLUMN locations.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.name IS 'Location name';


--
-- Name: COLUMN locations.type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.type IS 'Location type (SHOWROOM, BOUTIQUE, POD)';


--
-- Name: COLUMN locations.address; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.address IS 'Full address';


--
-- Name: COLUMN locations.city; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.city IS 'City or province';


--
-- Name: COLUMN locations.latitude; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.latitude IS 'GPS latitude';


--
-- Name: COLUMN locations.longitude; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.longitude IS 'GPS longitude';


--
-- Name: COLUMN locations.hours; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.hours IS 'Operating hours';


--
-- Name: COLUMN locations.phone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.phone IS 'Contact phone number';


--
-- Name: COLUMN locations.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.status IS 'Location status (ACTIVE, INACTIVE, TEMPORARY)';


--
-- Name: COLUMN locations.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.created_at IS 'Creation timestamp';


--
-- Name: COLUMN locations.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN locations.misa_warehouse_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.misa_warehouse_id IS 'MISA AMIS warehouse ID for sync';


--
-- Name: COLUMN locations.misa_warehouse_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.misa_warehouse_code IS 'MISA AMIS warehouse code';


--
-- Name: COLUMN locations.is_internal; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.is_internal IS 'If true, hidden from customer-facing features';


--
-- Name: COLUMN locations.capacity; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.capacity IS 'Maximum storage capacity (number of items or racks)';


--
-- Name: COLUMN locations.manager_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.manager_name IS 'Warehouse manager name';


--
-- Name: COLUMN locations.manager_phone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.manager_phone IS 'Warehouse manager phone';


--
-- Name: COLUMN locations.misa_last_synced_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.locations.misa_last_synced_at IS 'Last sync time with MISA AMIS';


--
-- Name: market_trends; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.market_trends (
    id bigint NOT NULL,
    trend_code character varying(100) NOT NULL,
    trend_name character varying(200) NOT NULL,
    trend_name_vn character varying(200),
    trend_type character varying(50),
    trend_subtype character varying(100),
    trend_period_start date,
    trend_period_end date,
    impact_score integer,
    confidence_level character varying(50),
    age_group_relevance text,
    geographic_relevance text,
    applicable_categories text,
    style_attributes text,
    price_impact_percentage numeric(5,2),
    volume_impact_percentage numeric(5,2),
    source character varying(50),
    source_url character varying(500),
    related_trends text,
    seasonal_pattern character varying(50),
    adoption_stage character varying(50),
    active boolean DEFAULT true,
    description text,
    description_vn text,
    implementation_notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: market_trends_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.market_trends ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.market_trends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: material_color_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.material_color_options (
    id bigint NOT NULL,
    color_code character varying(20) NOT NULL,
    color_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: material_color_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.material_color_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.material_color_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: material_inventory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.material_inventory (
    id uuid NOT NULL,
    name character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    vendor_id character varying(255) NOT NULL,
    base_price numeric(10,2),
    market_price numeric(10,2),
    currency character varying(10) NOT NULL,
    tax_customs_percent numeric(5,2),
    assembly_cost_local numeric(10,2),
    delivery_lead_time_days integer,
    production_lead_time_days integer,
    assembly_lead_time_days integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: material_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.material_options (
    id bigint NOT NULL,
    material_code character varying(20) NOT NULL,
    material_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: material_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.material_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.material_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: metal_purity_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.metal_purity_options (
    id bigint NOT NULL,
    purity_code character varying(20) NOT NULL,
    purity_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: metal_purity_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.metal_purity_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.metal_purity_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: metal_type_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.metal_type_options (
    id bigint NOT NULL,
    type_code character varying(20) NOT NULL,
    type_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: metal_type_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.metal_type_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.metal_type_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mirror_diamonds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mirror_diamonds (
    id character varying(255) NOT NULL,
    sku_code character varying(50) NOT NULL,
    color character varying(2) NOT NULL,
    clarity character varying(10) NOT NULL,
    carat_weight numeric(5,2) NOT NULL,
    shape character varying(20) NOT NULL,
    origin_country character varying(2),
    manufacturer_code character varying(10),
    manufacturer_name character varying(200),
    manufacturer_serial character varying(50),
    cert_number character varying(20) NOT NULL,
    cert_lab character varying(20),
    cert_url character varying(500),
    unit_price_usd numeric(10,2),
    total_price_usd numeric(10,2),
    invoice_number character varying(50),
    invoice_date date,
    customs_declaration character varying(50),
    import_date date,
    status character varying(20) NOT NULL,
    location character varying(100),
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_active boolean DEFAULT true,
    mirror_product_id character varying(30)
);


--
-- Name: mirror_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mirror_products (
    mirror_code character varying(30) NOT NULL,
    misa_item_code character varying(255),
    category character varying(100),
    item_name character varying(500),
    description text,
    price numeric(19,2),
    cost numeric(19,2),
    location character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    barcode character varying(100),
    status character varying(30) DEFAULT 'DRAFT'::character varying NOT NULL,
    published_at timestamp without time zone,
    fulfillment_completed_at timestamp without time zone,
    currency character varying(3) DEFAULT 'VND'::character varying,
    metal_type character varying(50),
    metal_purity character varying(20),
    stone_type character varying(50),
    weight_grams numeric(8,3),
    dimensions text,
    image_url character varying(1000),
    image_urls text,
    tags text,
    design_id character varying(100),
    designer_id bigint,
    featured boolean DEFAULT false,
    is_active boolean DEFAULT true,
    is_deleted boolean DEFAULT false,
    stock_quantity integer DEFAULT 0,
    min_stock_level integer DEFAULT 1,
    id character varying(30) NOT NULL,
    certificates_not_required boolean DEFAULT false,
    model_3d_id character varying(100),
    model_3d_not_required boolean DEFAULT false,
    material_color character varying(50),
    is_coated boolean DEFAULT false,
    coating_material character varying(50),
    stone_shape character varying(50),
    stone_weight character varying(50),
    side_stones character varying(100),
    country_of_origin character varying(10),
    stone_origin character varying(50),
    material_weight character varying(50),
    descriptive_code character varying(100),
    misa_category_id character varying(255),
    misa_category_code character varying(255),
    misa_category_name character varying(255),
    misa_inventory_id character varying(100),
    misa_synced boolean DEFAULT false NOT NULL,
    misa_sync_date timestamp without time zone,
    misa_last_synced_at timestamp without time zone
);


--
-- Name: misa_balance_trackers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.misa_balance_trackers (
    id bigint NOT NULL,
    inventory_item_code character varying(50) NOT NULL,
    inventory_item_id character varying(100),
    stock_id character varying(100),
    org_ref_id character varying(255),
    org_ref_no character varying(255),
    voucher_type integer,
    quantity_before integer,
    expected_quantity_after integer,
    quantity_change integer,
    actual_quantity_after integer,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    submitted_at timestamp without time zone,
    confirmed_at timestamp without time zone,
    timeout_at timestamp without time zone,
    poll_attempts integer DEFAULT 0,
    last_polled_at timestamp without time zone,
    notes text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: misa_balance_trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.misa_balance_trackers ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.misa_balance_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: misa_callback_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.misa_callback_logs (
    id bigint NOT NULL,
    app_id character varying(255) NOT NULL,
    org_company_code character varying(255) NOT NULL,
    data_type integer NOT NULL,
    data_type_name character varying(100),
    org_ref_id character varying(255),
    org_ref_no character varying(255),
    misa_ref_id character varying(255),
    misa_ref_no character varying(255),
    voucher_type integer,
    misa_success boolean DEFAULT false NOT NULL,
    misa_error_code character varying(100),
    misa_error_message text,
    processed boolean DEFAULT false NOT NULL,
    processing_success boolean,
    processing_error text,
    raw_payload text,
    signature character varying(500),
    signature_valid boolean,
    received_at timestamp without time zone NOT NULL,
    processed_at timestamp without time zone
);


--
-- Name: misa_callback_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.misa_callback_logs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.misa_callback_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: misa_customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.misa_customers (
    id bigint NOT NULL,
    customer_id character varying(255) NOT NULL,
    customer_code character varying(255),
    customer_name character varying(500) NOT NULL,
    phone character varying(50),
    normalized_phone character varying(50),
    email character varying(255),
    address text,
    province character varying(255),
    district character varying(255),
    commune character varying(255),
    gender integer,
    birthday date,
    identify_number character varying(50),
    description text,
    membership_code character varying(100),
    member_level_id character varying(255),
    member_level_name character varying(255),
    customer_category_id character varying(255),
    customer_category_name character varying(255),
    is_active boolean DEFAULT true,
    misa_last_modified timestamp without time zone,
    last_sync_date timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    sync_status character varying(50) DEFAULT 'PENDING'::character varying,
    sync_error_message text
);


--
-- Name: misa_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.misa_customers ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.misa_customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: misa_inventory_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.misa_inventory_items (
    id bigint NOT NULL,
    inventory_item_code character varying(255) NOT NULL,
    inventory_item_name character varying(500),
    inventory_item_id character varying(255),
    inventory_item_category_id character varying(255),
    inventory_item_category_name character varying(255),
    inventory_item_category_code character varying(255),
    brand_name character varying(255),
    unit_name character varying(100),
    unit_id character varying(255),
    sale_price numeric(19,2),
    cost_price numeric(19,2),
    quantity_on_hand integer,
    quantity_reserved integer,
    quantity_available integer,
    minimum_stock integer,
    maximum_stock integer,
    weight numeric(10,3),
    dimensions character varying(255),
    color character varying(100),
    size character varying(100),
    material character varying(255),
    description text,
    is_active boolean DEFAULT true,
    is_for_sale boolean DEFAULT true,
    is_for_purchase boolean DEFAULT true,
    tax_rate numeric(5,2),
    warranty_period integer,
    warranty_unit character varying(50),
    origin_country character varying(100),
    manufacturer character varying(255),
    barcode character varying(255),
    image_url character varying(1000),
    misa_last_modified timestamp without time zone,
    last_sync_date timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    sync_status character varying(50) DEFAULT 'PENDING'::character varying,
    sync_error_message text
);


--
-- Name: misa_inventory_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.misa_inventory_items ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.misa_inventory_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: misa_invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.misa_invoices (
    id bigint NOT NULL,
    invoice_id character varying(255) NOT NULL,
    invoice_code character varying(255),
    ref_no character varying(255),
    customer_id character varying(255),
    customer_code character varying(255),
    customer_name character varying(500),
    customer_address text,
    customer_phone character varying(50),
    branch_id character varying(255),
    branch_name character varying(255),
    invoice_date timestamp without time zone,
    total_amount numeric(19,2),
    discount_amount numeric(19,2),
    tax_amount numeric(19,2),
    final_amount numeric(19,2),
    paid_amount numeric(19,2),
    debt_amount numeric(19,2),
    cash_amount numeric(19,2),
    card_amount numeric(19,2),
    voucher_amount numeric(19,2),
    status integer,
    status_name character varying(100),
    payment_status integer,
    payment_status_name character varying(100),
    description text,
    note text,
    created_by character varying(255),
    misa_created_date timestamp without time zone,
    misa_last_modified timestamp without time zone,
    last_sync_date timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    sync_status character varying(50) DEFAULT 'PENDING'::character varying,
    sync_error_message text
);


--
-- Name: misa_invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.misa_invoices ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.misa_invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: misa_product_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.misa_product_categories (
    id bigint NOT NULL,
    category_id character varying(255) NOT NULL,
    category_name character varying(500) NOT NULL,
    category_code character varying(255),
    parent_id character varying(255),
    grade integer,
    is_leaf boolean DEFAULT true,
    is_active boolean DEFAULT true,
    description text,
    sort_order integer,
    misa_last_modified timestamp without time zone,
    last_sync_date timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    full_path character varying(1000),
    level_names character varying(1000),
    is_inactive boolean DEFAULT false,
    sync_status character varying(50) DEFAULT 'PENDING'::character varying,
    sync_error_message text
);


--
-- Name: misa_product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.misa_product_categories ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.misa_product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: misa_sync_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.misa_sync_logs (
    id bigint NOT NULL,
    sync_type character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    total_records integer,
    processed_records integer,
    successful_records integer,
    failed_records integer,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone,
    duration_ms bigint,
    error_message text,
    details text,
    triggered_by character varying(255),
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: misa_sync_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.misa_sync_logs ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.misa_sync_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: misa_warehouses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.misa_warehouses (
    id bigint NOT NULL,
    stock_id character varying(100) NOT NULL,
    stock_code character varying(50) NOT NULL,
    stock_name character varying(255) NOT NULL,
    description text,
    address character varying(500),
    branch_id character varying(100),
    branch_code character varying(50),
    branch_name character varying(255),
    is_inactive boolean DEFAULT false NOT NULL,
    misa_last_modified timestamp without time zone,
    last_sync_date timestamp without time zone,
    sync_status character varying(20) DEFAULT 'PENDING'::character varying,
    sync_error_message text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: misa_warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.misa_warehouses ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.misa_warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ops_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ops_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opt_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.opt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ord_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ord_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_item_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_items (
    id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    product_name character varying(500),
    quantity integer DEFAULT 1 NOT NULL,
    unit_price numeric(15,2) DEFAULT 0 NOT NULL,
    total_price numeric(15,2) DEFAULT 0 NOT NULL,
    metadata text,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: order_payment_schedule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_payment_schedule (
    id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    due_date timestamp without time zone NOT NULL,
    amount_due numeric(15,2) DEFAULT 0 NOT NULL,
    amount_paid numeric(15,2) DEFAULT 0 NOT NULL,
    status character varying(50) DEFAULT 'PENDING'::character varying NOT NULL,
    paid_at timestamp without time zone,
    payment_method character varying(100),
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: order_payment_schedule_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_payment_schedule_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_payment_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_payment_transactions (
    id character varying(30) NOT NULL,
    schedule_id character varying(30) NOT NULL,
    order_id character varying(30) NOT NULL,
    amount numeric(15,2) NOT NULL,
    payment_method character varying(100),
    paid_at timestamp without time zone NOT NULL,
    recorded_by character varying(255),
    notes text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: order_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_status_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_status_history (
    id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    status character varying(50) DEFAULT 'PENDING'::character varying NOT NULL,
    note text,
    changed_by character varying(255),
    changed_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: order_status_history_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_status_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    status character varying(50) DEFAULT 'PENDING'::character varying NOT NULL,
    payment_status character varying(50) DEFAULT 'PENDING'::character varying NOT NULL,
    payment_terms_type character varying(50) DEFAULT 'FIXED_SCHEDULE'::character varying NOT NULL,
    payment_terms text,
    payment_outstanding numeric(15,2) DEFAULT 0,
    subtotal_amount numeric(15,2) DEFAULT 0,
    total_amount numeric(15,2) DEFAULT 0 NOT NULL,
    currency character varying(3) DEFAULT 'VND'::character varying NOT NULL,
    notes text,
    expected_delivery_date timestamp without time zone,
    placed_at timestamp without time zone,
    last_status_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    configuration text,
    customer_notes text,
    quantity integer DEFAULT 1 NOT NULL,
    customer_name character varying(255),
    customer_email character varying(255),
    customer_phone character varying(50),
    source_channel character varying(100),
    confirmed_at timestamp without time zone,
    production_started_at timestamp without time zone,
    shipped_at timestamp without time zone,
    completed_at timestamp without time zone,
    final_payment_received boolean DEFAULT false NOT NULL,
    final_payment_date timestamp without time zone,
    misa_item_created boolean DEFAULT false NOT NULL,
    misa_sale_recorded boolean DEFAULT false NOT NULL,
    misa_item_id character varying(100),
    misa_invoice_id character varying(100),
    invoice_forwarded boolean DEFAULT false NOT NULL,
    invoice_forwarded_date timestamp without time zone,
    vendor_id character varying(50),
    misa_sku_retry_count integer DEFAULT 0 NOT NULL,
    misa_invoice_retry_count integer DEFAULT 0 NOT NULL,
    misa_last_sync_attempt timestamp without time zone
);


--
-- Name: COLUMN orders.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orders.user_id IS 'ID of the user placing the order';


--
-- Name: COLUMN orders.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orders.product_id IS 'Primary product related to the order';


--
-- Name: COLUMN orders.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orders.status IS 'Current order status';


--
-- Name: COLUMN orders.payment_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orders.payment_status IS 'Aggregated payment status';


--
-- Name: COLUMN orders.payment_terms_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orders.payment_terms_type IS 'Type of payment terms';


--
-- Name: COLUMN orders.payment_terms; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orders.payment_terms IS 'Serialized payment terms details';


--
-- Name: COLUMN orders.payment_outstanding; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orders.payment_outstanding IS 'Outstanding amount';


--
-- Name: COLUMN orders.subtotal_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orders.subtotal_amount IS 'Subtotal before adjustments';


--
-- Name: COLUMN orders.total_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.orders.total_amount IS 'Total amount due';


--
-- Name: ori_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ori_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: osh_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.osh_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: partner_capabilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.partner_capabilities (
    id character varying(36) NOT NULL,
    vendor_id character varying(36) NOT NULL,
    capability_type character varying(30) NOT NULL,
    lead_time_days integer,
    cost_per_piece numeric(15,2),
    cost_per_gram numeric(15,2),
    quality_rating integer,
    notes text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT chk_partner_quality_rating CHECK (((quality_rating IS NULL) OR ((quality_rating >= 1) AND (quality_rating <= 5))))
);


--
-- Name: partner_capability_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.partner_capability_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: partner_inventory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.partner_inventory (
    id character varying(255) NOT NULL,
    partner_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    quantity_on_hand integer DEFAULT 0 NOT NULL,
    quantity_reserved integer DEFAULT 0 NOT NULL,
    quantity_available integer DEFAULT 0 NOT NULL,
    wholesale_price numeric(15,2) NOT NULL,
    partner_retail_price numeric(15,2),
    mirror_retail_price numeric(15,2) NOT NULL,
    reorder_level integer DEFAULT 5 NOT NULL,
    max_stock_level integer DEFAULT 50 NOT NULL,
    last_restocked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    version bigint DEFAULT 0 NOT NULL
);


--
-- Name: COLUMN partner_inventory.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.id IS 'Primary key (PIV prefix)';


--
-- Name: COLUMN partner_inventory.partner_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.partner_id IS 'Reference to pod_partners';


--
-- Name: COLUMN partner_inventory.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.product_id IS 'Reference to mirror_products';


--
-- Name: COLUMN partner_inventory.quantity_on_hand; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.quantity_on_hand IS 'Total physical stock';


--
-- Name: COLUMN partner_inventory.quantity_reserved; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.quantity_reserved IS 'Reserved for pending sales';


--
-- Name: COLUMN partner_inventory.quantity_available; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.quantity_available IS 'Available for sale (on_hand - reserved)';


--
-- Name: COLUMN partner_inventory.wholesale_price; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.wholesale_price IS 'Price partner paid for this product';


--
-- Name: COLUMN partner_inventory.partner_retail_price; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.partner_retail_price IS 'Partner''s own retail price (null = use mirror price)';


--
-- Name: COLUMN partner_inventory.mirror_retail_price; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.mirror_retail_price IS 'Mirror''s official retail price';


--
-- Name: COLUMN partner_inventory.reorder_level; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.reorder_level IS 'Low stock alert threshold';


--
-- Name: COLUMN partner_inventory.max_stock_level; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.max_stock_level IS 'Maximum stock level';


--
-- Name: COLUMN partner_inventory.last_restocked_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.last_restocked_at IS 'Last restock timestamp';


--
-- Name: COLUMN partner_inventory.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.created_at IS 'Creation timestamp';


--
-- Name: COLUMN partner_inventory.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN partner_inventory.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN partner_inventory.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.is_active IS 'Active status flag';


--
-- Name: COLUMN partner_inventory.version; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_inventory.version IS 'Optimistic locking version';


--
-- Name: partner_sale_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.partner_sale_items (
    id character varying(255) NOT NULL,
    sale_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    inventory_id character varying(255) NOT NULL,
    quantity integer NOT NULL,
    wholesale_cost numeric(15,2) NOT NULL,
    selling_price numeric(15,2) NOT NULL,
    line_total numeric(15,2) NOT NULL,
    profit numeric(15,2) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN partner_sale_items.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.id IS 'Primary key (PSI prefix)';


--
-- Name: COLUMN partner_sale_items.sale_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.sale_id IS 'Reference to partner_sales';


--
-- Name: COLUMN partner_sale_items.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.product_id IS 'Reference to mirror_products';


--
-- Name: COLUMN partner_sale_items.inventory_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.inventory_id IS 'Reference to partner_inventory';


--
-- Name: COLUMN partner_sale_items.quantity; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.quantity IS 'Quantity sold';


--
-- Name: COLUMN partner_sale_items.wholesale_cost; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.wholesale_cost IS 'Cost per unit (wholesale price)';


--
-- Name: COLUMN partner_sale_items.selling_price; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.selling_price IS 'Selling price per unit';


--
-- Name: COLUMN partner_sale_items.line_total; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.line_total IS 'Line total (selling_price * quantity)';


--
-- Name: COLUMN partner_sale_items.profit; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.profit IS 'Profit on this line item';


--
-- Name: COLUMN partner_sale_items.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.created_at IS 'Creation timestamp';


--
-- Name: COLUMN partner_sale_items.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN partner_sale_items.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN partner_sale_items.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sale_items.is_active IS 'Active status flag';


--
-- Name: partner_sales; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.partner_sales (
    id character varying(255) NOT NULL,
    sale_number character varying(30) NOT NULL,
    partner_id character varying(255) NOT NULL,
    pod_id character varying(255),
    customer_name character varying(255),
    customer_phone character varying(20),
    customer_email character varying(255),
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    subtotal numeric(15,2) DEFAULT 0 NOT NULL,
    discount_amount numeric(15,2) DEFAULT 0 NOT NULL,
    tax_amount numeric(15,2) DEFAULT 0 NOT NULL,
    total_amount numeric(15,2) DEFAULT 0 NOT NULL,
    cost_of_goods numeric(15,2) DEFAULT 0 NOT NULL,
    profit_amount numeric(15,2) DEFAULT 0 NOT NULL,
    profit_margin_percent numeric(5,2) DEFAULT 0 NOT NULL,
    currency character varying(3) DEFAULT 'VND'::character varying NOT NULL,
    payment_method character varying(50),
    payment_reference character varying(100),
    qr_code_id character varying(255),
    notes text,
    sold_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN partner_sales.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.id IS 'Primary key (PSL prefix)';


--
-- Name: COLUMN partner_sales.sale_number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.sale_number IS 'Human-readable sale number';


--
-- Name: COLUMN partner_sales.partner_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.partner_id IS 'Reference to pod_partners';


--
-- Name: COLUMN partner_sales.pod_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.pod_id IS 'Reference to pods (where the sale happened)';


--
-- Name: COLUMN partner_sales.customer_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.customer_name IS 'Customer name';


--
-- Name: COLUMN partner_sales.customer_phone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.customer_phone IS 'Customer phone';


--
-- Name: COLUMN partner_sales.customer_email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.customer_email IS 'Customer email';


--
-- Name: COLUMN partner_sales.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.status IS 'Sale status';


--
-- Name: COLUMN partner_sales.subtotal; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.subtotal IS 'Sum of selling prices';


--
-- Name: COLUMN partner_sales.discount_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.discount_amount IS 'Sale discount';


--
-- Name: COLUMN partner_sales.tax_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.tax_amount IS 'Tax amount';


--
-- Name: COLUMN partner_sales.total_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.total_amount IS 'Final total';


--
-- Name: COLUMN partner_sales.cost_of_goods; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.cost_of_goods IS 'Total wholesale cost';


--
-- Name: COLUMN partner_sales.profit_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.profit_amount IS 'Profit (total - cost)';


--
-- Name: COLUMN partner_sales.profit_margin_percent; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.profit_margin_percent IS 'Profit margin %';


--
-- Name: COLUMN partner_sales.currency; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.currency IS 'Currency code';


--
-- Name: COLUMN partner_sales.payment_method; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.payment_method IS 'Payment method';


--
-- Name: COLUMN partner_sales.payment_reference; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.payment_reference IS 'Payment reference';


--
-- Name: COLUMN partner_sales.qr_code_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.qr_code_id IS 'QR code that led to this sale';


--
-- Name: COLUMN partner_sales.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.notes IS 'Sale notes';


--
-- Name: COLUMN partner_sales.sold_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.sold_at IS 'When the sale happened';


--
-- Name: COLUMN partner_sales.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.created_at IS 'Creation timestamp';


--
-- Name: COLUMN partner_sales.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN partner_sales.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN partner_sales.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.partner_sales.is_active IS 'Active status flag';


--
-- Name: pat_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pat_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pcm_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pcm_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pcp_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pcp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(255),
    resource character varying(50),
    action character varying(20),
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by character varying(50),
    updated_by character varying(50)
);


--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: piv_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.piv_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pjb_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pjb_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pji_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pji_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pod_attributions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pod_attributions (
    id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    pod_id character varying(255) NOT NULL,
    partner_id character varying(255) NOT NULL,
    qr_code_id character varying(255),
    scan_id character varying(255),
    attribution_type character varying(30) NOT NULL,
    attribution_weight numeric(5,4) DEFAULT 1 NOT NULL,
    order_amount numeric(15,2) NOT NULL,
    attributed_amount numeric(15,2) NOT NULL,
    currency character varying(3) DEFAULT 'VND'::character varying NOT NULL,
    first_scan_at timestamp without time zone,
    last_scan_at timestamp without time zone,
    order_placed_at timestamp without time zone NOT NULL,
    days_to_conversion integer,
    touch_count integer DEFAULT 1,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    commission_id character varying(255),
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN pod_attributions.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.id IS 'Primary key (PAT prefix)';


--
-- Name: COLUMN pod_attributions.order_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.order_id IS 'Reference to orders';


--
-- Name: COLUMN pod_attributions.pod_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.pod_id IS 'Reference to pods';


--
-- Name: COLUMN pod_attributions.partner_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.partner_id IS 'Reference to pod_partners';


--
-- Name: COLUMN pod_attributions.qr_code_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.qr_code_id IS 'Reference to pod_qr_codes';


--
-- Name: COLUMN pod_attributions.scan_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.scan_id IS 'Reference to the original QR scan';


--
-- Name: COLUMN pod_attributions.attribution_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.attribution_type IS 'Type: FIRST_TOUCH, LAST_TOUCH, MULTI_TOUCH';


--
-- Name: COLUMN pod_attributions.attribution_weight; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.attribution_weight IS 'Weight for multi-touch attribution (0.0-1.0)';


--
-- Name: COLUMN pod_attributions.order_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.order_amount IS 'Order total amount';


--
-- Name: COLUMN pod_attributions.attributed_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.attributed_amount IS 'Amount attributed to this POD (order_amount * weight)';


--
-- Name: COLUMN pod_attributions.currency; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.currency IS 'Currency code';


--
-- Name: COLUMN pod_attributions.first_scan_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.first_scan_at IS 'First scan timestamp in attribution window';


--
-- Name: COLUMN pod_attributions.last_scan_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.last_scan_at IS 'Last scan timestamp before order';


--
-- Name: COLUMN pod_attributions.order_placed_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.order_placed_at IS 'Order placement timestamp';


--
-- Name: COLUMN pod_attributions.days_to_conversion; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.days_to_conversion IS 'Days between first scan and order';


--
-- Name: COLUMN pod_attributions.touch_count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.touch_count IS 'Number of touches before conversion';


--
-- Name: COLUMN pod_attributions.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.status IS 'Attribution status (PENDING, CONFIRMED, CANCELLED)';


--
-- Name: COLUMN pod_attributions.commission_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.commission_id IS 'Reference to pod_commissions when commission is calculated';


--
-- Name: COLUMN pod_attributions.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.notes IS 'Internal notes';


--
-- Name: COLUMN pod_attributions.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.created_at IS 'Creation timestamp';


--
-- Name: COLUMN pod_attributions.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN pod_attributions.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN pod_attributions.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_attributions.is_active IS 'Active status flag';


--
-- Name: pod_commissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pod_commissions (
    id character varying(30) NOT NULL,
    partner_id character varying(30) NOT NULL,
    pod_id character varying(30),
    commission_rate numeric(5,4) NOT NULL,
    commission_amount numeric(19,2) NOT NULL,
    status character varying(50) NOT NULL,
    attributed_scan_id character varying(30),
    approved_at timestamp without time zone,
    approved_by character varying(100),
    paid_at timestamp without time zone,
    paid_by character varying(100),
    payment_reference character varying(255),
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    created_by character varying(100),
    updated_by character varying(100),
    adjustment_reason text,
    adjustments numeric(15,2),
    attributed_amount numeric(15,2) DEFAULT 0 NOT NULL,
    bank_account character varying(50),
    bank_name character varying(100),
    currency character varying(3) DEFAULT 'VND'::character varying NOT NULL,
    final_amount numeric(15,2) DEFAULT 0 NOT NULL,
    payment_method character varying(50),
    total_order_amount numeric(15,2) DEFAULT 0 NOT NULL,
    total_orders integer DEFAULT 0 NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    period_start date NOT NULL,
    period_end date NOT NULL
);


--
-- Name: COLUMN pod_commissions.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.id IS 'Primary key (PCM prefix)';


--
-- Name: COLUMN pod_commissions.partner_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.partner_id IS 'FK to pod_partners';


--
-- Name: COLUMN pod_commissions.pod_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.pod_id IS 'FK to pods (optional)';


--
-- Name: COLUMN pod_commissions.commission_rate; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.commission_rate IS 'Commission rate applied';


--
-- Name: COLUMN pod_commissions.commission_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.commission_amount IS 'Calculated commission amount';


--
-- Name: COLUMN pod_commissions.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.status IS 'Status: PENDING, APPROVED, PAID, CANCELLED';


--
-- Name: COLUMN pod_commissions.attributed_scan_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.attributed_scan_id IS 'FK to qr_scans (attribution source)';


--
-- Name: COLUMN pod_commissions.approved_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.approved_at IS 'When commission was approved';


--
-- Name: COLUMN pod_commissions.approved_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.approved_by IS 'Who approved the commission';


--
-- Name: COLUMN pod_commissions.paid_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.paid_at IS 'When commission was paid';


--
-- Name: COLUMN pod_commissions.paid_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.paid_by IS 'Who marked as paid';


--
-- Name: COLUMN pod_commissions.payment_reference; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.payment_reference IS 'Payment reference/transaction ID';


--
-- Name: COLUMN pod_commissions.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.notes IS 'Additional notes';


--
-- Name: COLUMN pod_commissions.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.created_at IS 'Creation timestamp';


--
-- Name: COLUMN pod_commissions.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN pod_commissions.created_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.created_by IS 'User who created the record';


--
-- Name: COLUMN pod_commissions.updated_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.updated_by IS 'User who last updated the record';


--
-- Name: COLUMN pod_commissions.adjustment_reason; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.adjustment_reason IS 'Reason for adjustment';


--
-- Name: COLUMN pod_commissions.adjustments; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.adjustments IS 'Adjustment amount';


--
-- Name: COLUMN pod_commissions.attributed_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.attributed_amount IS 'Attributed amount';


--
-- Name: COLUMN pod_commissions.bank_account; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.bank_account IS 'Bank account number';


--
-- Name: COLUMN pod_commissions.bank_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.bank_name IS 'Bank name';


--
-- Name: COLUMN pod_commissions.currency; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.currency IS 'Currency';


--
-- Name: COLUMN pod_commissions.final_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.final_amount IS 'Final amount';


--
-- Name: COLUMN pod_commissions.payment_method; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.payment_method IS 'Payment method';


--
-- Name: COLUMN pod_commissions.total_order_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.total_order_amount IS 'Total order amount';


--
-- Name: COLUMN pod_commissions.total_orders; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.total_orders IS 'Total orders';


--
-- Name: COLUMN pod_commissions.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN pod_commissions.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.is_active IS 'Active flag';


--
-- Name: COLUMN pod_commissions.period_start; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.period_start IS 'Period start date';


--
-- Name: COLUMN pod_commissions.period_end; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_commissions.period_end IS 'Period end date';


--
-- Name: pod_partners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pod_partners (
    id character varying(30) NOT NULL,
    business_name character varying(255) NOT NULL,
    contact_name character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    address character varying(500),
    city character varying(100),
    district character varying(100),
    commission_rate numeric(5,4),
    contract_start_date date,
    contract_end_date date,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    created_by character varying(100),
    updated_by character varying(100),
    is_deleted boolean DEFAULT false NOT NULL,
    address_line1 character varying(255),
    address_line2 character varying(255),
    state character varying(100),
    postal_code character varying(20),
    country character varying(100),
    approved_at timestamp without time zone,
    approved_by character varying(100),
    business_license character varying(100),
    tax_id character varying(50),
    tier character varying(20) DEFAULT 'BRONZE'::character varying NOT NULL,
    user_id bigint,
    business_type character varying(50) DEFAULT 'OTHER'::character varying NOT NULL,
    contact_email character varying(255) DEFAULT 'unknown@example.com'::character varying NOT NULL,
    contact_phone character varying(50),
    is_active boolean DEFAULT true NOT NULL,
    partner_type character varying(20) DEFAULT 'LOCATION'::character varying NOT NULL,
    wholesale_discount_rate numeric(5,2) DEFAULT 0,
    territory character varying(255),
    can_set_own_prices boolean DEFAULT false NOT NULL,
    min_markup_percent numeric(5,2),
    max_markup_percent numeric(5,2),
    security_deposit numeric(15,2),
    bank_account_number character varying(50),
    bank_name character varying(100),
    bank_branch character varying(100)
);


--
-- Name: COLUMN pod_partners.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.id IS 'Primary key (PTR prefix)';


--
-- Name: COLUMN pod_partners.business_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.business_name IS 'Partner business name';


--
-- Name: COLUMN pod_partners.contact_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.contact_name IS 'Primary contact person name';


--
-- Name: COLUMN pod_partners.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.status IS 'Status: PENDING, ACTIVE, SUSPENDED, TERMINATED';


--
-- Name: COLUMN pod_partners.address; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.address IS 'Street address';


--
-- Name: COLUMN pod_partners.city; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.city IS 'City';


--
-- Name: COLUMN pod_partners.district; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.district IS 'District/Ward';


--
-- Name: COLUMN pod_partners.commission_rate; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.commission_rate IS 'Commission rate for LOCATION type (e.g., 0.05 for 5%)';


--
-- Name: COLUMN pod_partners.contract_start_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.contract_start_date IS 'Contract start date';


--
-- Name: COLUMN pod_partners.contract_end_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.contract_end_date IS 'Contract end date';


--
-- Name: COLUMN pod_partners.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.notes IS 'Additional notes';


--
-- Name: COLUMN pod_partners.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.created_at IS 'Creation timestamp';


--
-- Name: COLUMN pod_partners.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN pod_partners.created_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.created_by IS 'User who created the record';


--
-- Name: COLUMN pod_partners.updated_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.updated_by IS 'User who last updated the record';


--
-- Name: COLUMN pod_partners.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN pod_partners.address_line1; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.address_line1 IS 'Address line 1';


--
-- Name: COLUMN pod_partners.address_line2; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.address_line2 IS 'Address line 2';


--
-- Name: COLUMN pod_partners.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.state IS 'State/Province';


--
-- Name: COLUMN pod_partners.postal_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.postal_code IS 'Postal/ZIP code';


--
-- Name: COLUMN pod_partners.country; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.country IS 'Country';


--
-- Name: COLUMN pod_partners.approved_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.approved_at IS 'Timestamp when partner was approved';


--
-- Name: COLUMN pod_partners.approved_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.approved_by IS 'User who approved the partner';


--
-- Name: COLUMN pod_partners.business_license; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.business_license IS 'Business license number';


--
-- Name: COLUMN pod_partners.tax_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.tax_id IS 'Tax identification number';


--
-- Name: COLUMN pod_partners.tier; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.tier IS 'Partner tier';


--
-- Name: COLUMN pod_partners.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.user_id IS 'Reference to users table for portal access';


--
-- Name: COLUMN pod_partners.business_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.business_type IS 'Type of business';


--
-- Name: COLUMN pod_partners.contact_email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.contact_email IS 'Primary contact email';


--
-- Name: COLUMN pod_partners.contact_phone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.contact_phone IS 'Primary contact phone';


--
-- Name: COLUMN pod_partners.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_partners.is_active IS 'Active status flag';


--
-- Name: pod_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pod_products (
    id bigint NOT NULL,
    pod_id character varying(30) NOT NULL,
    product_id character varying(30) NOT NULL,
    display_order integer DEFAULT 0 NOT NULL,
    assigned_date date NOT NULL,
    removed_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: COLUMN pod_products.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_products.id IS 'Primary key (auto-increment)';


--
-- Name: COLUMN pod_products.pod_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_products.pod_id IS 'FK to pods';


--
-- Name: COLUMN pod_products.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_products.product_id IS 'FK to mirror_products';


--
-- Name: COLUMN pod_products.display_order; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_products.display_order IS 'Display order within the POD';


--
-- Name: COLUMN pod_products.assigned_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_products.assigned_date IS 'Date product was assigned to POD';


--
-- Name: COLUMN pod_products.removed_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_products.removed_date IS 'Date product was removed from POD (null if still active)';


--
-- Name: COLUMN pod_products.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_products.created_at IS 'Creation timestamp';


--
-- Name: COLUMN pod_products.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_products.updated_at IS 'Last update timestamp';


--
-- Name: pod_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pod_products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pod_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pod_qr_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pod_qr_codes (
    id character varying(255) NOT NULL,
    pod_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    short_code character varying(20) NOT NULL,
    full_url character varying(500),
    qr_image_url character varying(500),
    status character varying(20) DEFAULT 'ACTIVE'::character varying NOT NULL,
    scan_count bigint DEFAULT 0 NOT NULL,
    last_scanned_at timestamp without time zone,
    expires_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    qr_code_type character varying(20) DEFAULT 'POD_QR'::character varying NOT NULL,
    metadata jsonb
);


--
-- Name: COLUMN pod_qr_codes.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.id IS 'Primary key (PQR prefix)';


--
-- Name: COLUMN pod_qr_codes.pod_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.pod_id IS 'Reference to pods';


--
-- Name: COLUMN pod_qr_codes.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.product_id IS 'Reference to mirror_products';


--
-- Name: COLUMN pod_qr_codes.short_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.short_code IS 'Short unique code for URL (e.g., ABC123)';


--
-- Name: COLUMN pod_qr_codes.full_url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.full_url IS 'Full redirect URL';


--
-- Name: COLUMN pod_qr_codes.qr_image_url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.qr_image_url IS 'URL to QR code image in S3/R2';


--
-- Name: COLUMN pod_qr_codes.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.status IS 'QR code status (ACTIVE, INACTIVE, EXPIRED)';


--
-- Name: COLUMN pod_qr_codes.scan_count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.scan_count IS 'Total number of scans';


--
-- Name: COLUMN pod_qr_codes.last_scanned_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.last_scanned_at IS 'Last scan timestamp';


--
-- Name: COLUMN pod_qr_codes.expires_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.expires_at IS 'Expiration timestamp (optional)';


--
-- Name: COLUMN pod_qr_codes.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.created_at IS 'Creation timestamp';


--
-- Name: COLUMN pod_qr_codes.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN pod_qr_codes.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN pod_qr_codes.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_codes.is_active IS 'Active status flag';


--
-- Name: pod_qr_scans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pod_qr_scans (
    id character varying(255) NOT NULL,
    qr_code_id character varying(255) NOT NULL,
    pod_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    partner_id character varying(255) NOT NULL,
    session_id character varying(100),
    user_id bigint,
    ip_address character varying(45),
    user_agent character varying(500),
    device_type character varying(20),
    os character varying(50),
    browser character varying(50),
    referer character varying(500),
    country character varying(100),
    city character varying(100),
    scanned_at timestamp without time zone NOT NULL,
    is_unique boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN pod_qr_scans.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.id IS 'Primary key (PQS prefix)';


--
-- Name: COLUMN pod_qr_scans.qr_code_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.qr_code_id IS 'Reference to pod_qr_codes';


--
-- Name: COLUMN pod_qr_scans.pod_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.pod_id IS 'Reference to pods (denormalized for performance)';


--
-- Name: COLUMN pod_qr_scans.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.product_id IS 'Reference to mirror_products (denormalized)';


--
-- Name: COLUMN pod_qr_scans.partner_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.partner_id IS 'Reference to pod_partners (denormalized)';


--
-- Name: COLUMN pod_qr_scans.session_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.session_id IS 'Browser/device session identifier';


--
-- Name: COLUMN pod_qr_scans.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.user_id IS 'User ID if logged in';


--
-- Name: COLUMN pod_qr_scans.ip_address; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.ip_address IS 'Client IP address (IPv4 or IPv6)';


--
-- Name: COLUMN pod_qr_scans.user_agent; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.user_agent IS 'Browser user agent string';


--
-- Name: COLUMN pod_qr_scans.device_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.device_type IS 'Device type (MOBILE, TABLET, DESKTOP)';


--
-- Name: COLUMN pod_qr_scans.os; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.os IS 'Operating system';


--
-- Name: COLUMN pod_qr_scans.browser; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.browser IS 'Browser name';


--
-- Name: COLUMN pod_qr_scans.referer; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.referer IS 'HTTP referer if available';


--
-- Name: COLUMN pod_qr_scans.country; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.country IS 'Country from IP geolocation';


--
-- Name: COLUMN pod_qr_scans.city; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.city IS 'City from IP geolocation';


--
-- Name: COLUMN pod_qr_scans.scanned_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.scanned_at IS 'Scan timestamp';


--
-- Name: COLUMN pod_qr_scans.is_unique; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.is_unique IS 'Is this a unique scan (not duplicate within window)';


--
-- Name: COLUMN pod_qr_scans.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.created_at IS 'Creation timestamp';


--
-- Name: COLUMN pod_qr_scans.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN pod_qr_scans.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN pod_qr_scans.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_qr_scans.is_active IS 'Active status flag';


--
-- Name: pod_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pod_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pod_user_attributions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pod_user_attributions (
    id character varying(20) NOT NULL,
    user_id bigint NOT NULL,
    pod_id character varying(20) NOT NULL,
    partner_id character varying(20) NOT NULL,
    product_id character varying(20),
    qr_code_id character varying(20),
    first_scan_at timestamp with time zone NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    status character varying(20) DEFAULT 'ACTIVE'::character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN pod_user_attributions.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.id IS 'Primary key (PUA prefix)';


--
-- Name: COLUMN pod_user_attributions.user_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.user_id IS 'Reference to users';


--
-- Name: COLUMN pod_user_attributions.pod_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.pod_id IS 'Reference to pods';


--
-- Name: COLUMN pod_user_attributions.partner_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.partner_id IS 'Reference to pod_partners';


--
-- Name: COLUMN pod_user_attributions.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.product_id IS 'Product that was scanned';


--
-- Name: COLUMN pod_user_attributions.qr_code_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.qr_code_id IS 'QR code that was scanned';


--
-- Name: COLUMN pod_user_attributions.first_scan_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.first_scan_at IS 'Timestamp of the first scan';


--
-- Name: COLUMN pod_user_attributions.expires_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.expires_at IS 'Attribution expiry (first_scan_at + 30 days)';


--
-- Name: COLUMN pod_user_attributions.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.status IS 'Attribution status (ACTIVE, EXPIRED)';


--
-- Name: COLUMN pod_user_attributions.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.created_at IS 'Creation timestamp';


--
-- Name: COLUMN pod_user_attributions.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN pod_user_attributions.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN pod_user_attributions.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pod_user_attributions.is_active IS 'Active status flag';


--
-- Name: pods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pods (
    id character varying(30) NOT NULL,
    partner_id character varying(30) NOT NULL,
    pod_type character varying(50) DEFAULT 'VITRINE'::character varying NOT NULL,
    location character varying(500),
    status character varying(50) NOT NULL,
    installed_date date,
    max_products integer DEFAULT 10 NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    created_by character varying(100),
    updated_by character varying(100),
    is_deleted boolean DEFAULT false NOT NULL,
    description text,
    location_name character varying(255),
    address_line1 character varying(255),
    address_line2 character varying(255),
    city character varying(100),
    state character varying(100),
    postal_code character varying(20),
    country character varying(100),
    latitude numeric(10,8),
    longitude numeric(11,8),
    display_capacity integer DEFAULT 10,
    installation_date date,
    last_maintenance_date date,
    next_maintenance_date date,
    is_active boolean DEFAULT true NOT NULL,
    name character varying(255) DEFAULT 'Unknown POD'::character varying NOT NULL,
    commission_rate numeric(5,2),
    location_id character varying(50)
);


--
-- Name: COLUMN pods.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.id IS 'Primary key (POD prefix)';


--
-- Name: COLUMN pods.partner_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.partner_id IS 'FK to pod_partners';


--
-- Name: COLUMN pods.pod_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.pod_type IS 'POD type: VITRINE, PHYGITAL, WALL, EVENT';


--
-- Name: COLUMN pods.location; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.location IS 'Specific location within partner premises';


--
-- Name: COLUMN pods.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.status IS 'Status: SETUP, ACTIVE, MAINTENANCE, INACTIVE';


--
-- Name: COLUMN pods.installed_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.installed_date IS 'Date POD was installed';


--
-- Name: COLUMN pods.max_products; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.max_products IS 'Maximum number of products this POD can display';


--
-- Name: COLUMN pods.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.notes IS 'Additional notes';


--
-- Name: COLUMN pods.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.created_at IS 'Creation timestamp';


--
-- Name: COLUMN pods.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN pods.created_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.created_by IS 'User who created the record';


--
-- Name: COLUMN pods.updated_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.updated_by IS 'User who last updated the record';


--
-- Name: COLUMN pods.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN pods.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.description IS 'POD description';


--
-- Name: COLUMN pods.location_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.location_name IS 'Physical location name';


--
-- Name: COLUMN pods.address_line1; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.address_line1 IS 'Address line 1';


--
-- Name: COLUMN pods.address_line2; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.address_line2 IS 'Address line 2';


--
-- Name: COLUMN pods.city; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.city IS 'City';


--
-- Name: COLUMN pods.state; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.state IS 'State/Province';


--
-- Name: COLUMN pods.postal_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.postal_code IS 'Postal/ZIP code';


--
-- Name: COLUMN pods.country; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.country IS 'Country';


--
-- Name: COLUMN pods.latitude; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.latitude IS 'GPS latitude';


--
-- Name: COLUMN pods.longitude; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.longitude IS 'GPS longitude';


--
-- Name: COLUMN pods.display_capacity; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.display_capacity IS 'Maximum number of products';


--
-- Name: COLUMN pods.installation_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.installation_date IS 'Date when POD was installed';


--
-- Name: COLUMN pods.last_maintenance_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.last_maintenance_date IS 'Last maintenance date';


--
-- Name: COLUMN pods.next_maintenance_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.next_maintenance_date IS 'Scheduled next maintenance';


--
-- Name: COLUMN pods.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.is_active IS 'Active status flag';


--
-- Name: COLUMN pods.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.pods.name IS 'Display name for the POD';


--
-- Name: por_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.por_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pos_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pos_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ppl_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ppl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pqr_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pqr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pqs_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pqs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prd_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.prd_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: print_job_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.print_job_items (
    id character varying(50) NOT NULL,
    print_job_id character varying(50) NOT NULL,
    product_id character varying(50) NOT NULL,
    epc character varying(50),
    zpl_data text,
    status character varying(50) DEFAULT 'PENDING'::character varying NOT NULL,
    error_message text,
    printed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: print_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.print_jobs (
    id character varying(50) NOT NULL,
    template_id character varying(50) NOT NULL,
    status character varying(50) DEFAULT 'PENDING'::character varying NOT NULL,
    total_labels integer NOT NULL,
    printed_labels integer DEFAULT 0 NOT NULL,
    failed_labels integer DEFAULT 0 NOT NULL,
    printer_name character varying(255),
    print_method character varying(50),
    zpl_data text,
    error_message text,
    options jsonb,
    started_at timestamp with time zone,
    completed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying(50),
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: product_certificates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_certificates (
    id bigint NOT NULL,
    product_id character varying(30) NOT NULL,
    certificate_id character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: COLUMN product_certificates.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.product_certificates.product_id IS 'Reference to mirror_products.id';


--
-- Name: COLUMN product_certificates.certificate_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.product_certificates.certificate_id IS 'Reference to certificates.id';


--
-- Name: product_certificates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_certificates ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_certificates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_finder_combinations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_finder_combinations (
    id bigint NOT NULL,
    band_code character varying(50) NOT NULL,
    main_stone_code character varying(50) NOT NULL,
    side_stone_code character varying(50) NOT NULL,
    model_id character varying(100),
    images json,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: product_finder_combinations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_finder_combinations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_finder_combinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_finder_selections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_finder_selections (
    id bigint NOT NULL,
    user_id character varying(255) NOT NULL,
    main_stone_code character varying(50) NOT NULL,
    main_stone_price numeric(12,2),
    band_code character varying(50) NOT NULL,
    band_price numeric(12,2),
    side_stone_code character varying(50) NOT NULL,
    side_stone_price numeric(12,2),
    estimated_total numeric(12,2),
    model_key character varying(100),
    model_id character varying(100),
    main_color character varying(20),
    side_color character varying(20),
    band_color character varying(20),
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: product_finder_selections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_finder_selections ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_finder_selections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: product_finder_side_stone_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_finder_side_stone_options (
    id bigint NOT NULL,
    stone_code character varying(50) NOT NULL,
    stone_name character varying(100) NOT NULL,
    description character varying(255),
    image character varying(500),
    price numeric(12,2) DEFAULT 0.00,
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: product_finder_side_stone_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.product_finder_side_stone_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.product_finder_side_stone_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: production_order_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.production_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: production_order_stage_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.production_order_stage_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: production_order_stages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.production_order_stages (
    id character varying(36) NOT NULL,
    production_order_id character varying(36) NOT NULL,
    workflow_stage_id character varying(36) NOT NULL,
    assigned_vendor_id character varying(36),
    stage_order integer NOT NULL,
    stage_name character varying(255) NOT NULL,
    required_capability character varying(30),
    status character varying(20) DEFAULT 'BLOCKED'::character varying NOT NULL,
    planned_start_date date,
    planned_end_date date,
    actual_start_date date,
    actual_end_date date,
    estimated_cost numeric(15,2),
    actual_cost numeric(15,2),
    is_final_stage boolean DEFAULT false NOT NULL,
    notes text,
    completed_by character varying(100),
    completed_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT chk_pos_actual_dates CHECK (((actual_end_date IS NULL) OR (actual_start_date IS NULL) OR (actual_end_date >= actual_start_date))),
    CONSTRAINT chk_pos_costs_non_negative CHECK ((((estimated_cost IS NULL) OR (estimated_cost >= (0)::numeric)) AND ((actual_cost IS NULL) OR (actual_cost >= (0)::numeric)))),
    CONSTRAINT chk_pos_planned_dates CHECK (((planned_end_date IS NULL) OR (planned_start_date IS NULL) OR (planned_end_date >= planned_start_date))),
    CONSTRAINT chk_pos_stage_order_positive CHECK ((stage_order > 0)),
    CONSTRAINT chk_pos_status CHECK (((status)::text = ANY (ARRAY[('BLOCKED'::character varying)::text, ('READY'::character varying)::text, ('IN_PROGRESS'::character varying)::text, ('COMPLETED'::character varying)::text, ('SKIPPED'::character varying)::text])))
);


--
-- Name: production_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.production_orders (
    id character varying(36) NOT NULL,
    production_plan_id character varying(36) NOT NULL,
    collection_plan_item_id uuid,
    jtrc_id character varying(36),
    order_number character varying(50) NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    status character varying(20) DEFAULT 'DRAFT'::character varying NOT NULL,
    current_stage_order integer,
    current_holder_id character varying(36),
    estimated_completion_date date,
    actual_completion_date date,
    notes text,
    created_by character varying(100),
    updated_by character varying(100),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    needs_spec_review boolean DEFAULT false,
    CONSTRAINT chk_por_quantity_positive CHECK ((quantity > 0)),
    CONSTRAINT chk_por_status CHECK (((status)::text = ANY (ARRAY[('DRAFT'::character varying)::text, ('READY'::character varying)::text, ('IN_PROGRESS'::character varying)::text, ('COMPLETED'::character varying)::text, ('CANCELLED'::character varying)::text])))
);


--
-- Name: production_plan_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.production_plan_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: production_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.production_plans (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    collection_plan_id uuid,
    workflow_template_id character varying(36) NOT NULL,
    status character varying(20) DEFAULT 'DRAFT'::character varying NOT NULL,
    target_start_date date,
    target_end_date date,
    actual_start_date date,
    actual_end_date date,
    notes text,
    created_by character varying(100),
    updated_by character varying(100),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    version bigint DEFAULT 0 NOT NULL,
    CONSTRAINT chk_ppl_dates CHECK (((target_end_date IS NULL) OR (target_start_date IS NULL) OR (target_end_date >= target_start_date))),
    CONSTRAINT chk_ppl_status CHECK (((status)::text = ANY (ARRAY[('DRAFT'::character varying)::text, ('PLANNING'::character varying)::text, ('APPROVED'::character varying)::text, ('IN_PRODUCTION'::character varying)::text, ('COMPLETED'::character varying)::text, ('CANCELLED'::character varying)::text])))
);


--
-- Name: psi_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.psi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: psl_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.psl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ptn_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ptn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ptr_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ptr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ptx_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ptx_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pua_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pua_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: purchase_order_age_group_allocations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_order_age_group_allocations (
    id uuid NOT NULL,
    purchase_order_id uuid NOT NULL,
    age_group_id uuid NOT NULL,
    allocation_percentage numeric(5,2) NOT NULL,
    quantity integer
);


--
-- Name: purchase_order_item_variants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_order_item_variants (
    id uuid NOT NULL,
    purchase_order_item_id uuid NOT NULL,
    material_id uuid NOT NULL,
    age_group_id uuid NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2)
);


--
-- Name: purchase_order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_order_items (
    id uuid NOT NULL,
    purchase_order_id uuid NOT NULL,
    material_id uuid NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(10,2),
    total_price numeric(12,2)
);


--
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.purchase_orders (
    id uuid NOT NULL,
    vendor_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    expected_delivery_date date,
    total_cost numeric(12,2)
);


--
-- Name: qr_codes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.qr_codes (
    id character varying(30) NOT NULL,
    code character varying(100) NOT NULL,
    qr_code_type character varying(50) NOT NULL,
    partner_id character varying(30),
    pod_id character varying(30),
    product_id character varying(30),
    status character varying(50) NOT NULL,
    target_url character varying(1000),
    expires_at timestamp without time zone,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    created_by character varying(100),
    updated_by character varying(100)
);


--
-- Name: COLUMN qr_codes.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.id IS 'Primary key (QRC prefix)';


--
-- Name: COLUMN qr_codes.code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.code IS 'Unique QR code value';


--
-- Name: COLUMN qr_codes.qr_code_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.qr_code_type IS 'Type: POD, PRODUCT, PARTNER, PHYGITAL';


--
-- Name: COLUMN qr_codes.partner_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.partner_id IS 'FK to pod_partners (optional)';


--
-- Name: COLUMN qr_codes.pod_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.pod_id IS 'FK to pods (optional)';


--
-- Name: COLUMN qr_codes.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.product_id IS 'FK to mirror_products (optional)';


--
-- Name: COLUMN qr_codes.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.status IS 'Status: ACTIVE, INACTIVE, EXPIRED';


--
-- Name: COLUMN qr_codes.target_url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.target_url IS 'Redirect target URL';


--
-- Name: COLUMN qr_codes.expires_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.expires_at IS 'Optional expiration datetime';


--
-- Name: COLUMN qr_codes.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.description IS 'Description of the QR code';


--
-- Name: COLUMN qr_codes.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.created_at IS 'Creation timestamp';


--
-- Name: COLUMN qr_codes.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN qr_codes.created_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.created_by IS 'User who created the record';


--
-- Name: COLUMN qr_codes.updated_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_codes.updated_by IS 'User who last updated the record';


--
-- Name: qr_scans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.qr_scans (
    id character varying(30) NOT NULL,
    qr_code_id character varying(30) NOT NULL,
    scanned_at timestamp without time zone NOT NULL,
    device_fingerprint character varying(255),
    ip_address character varying(45),
    user_agent character varying(500),
    session_id character varying(100),
    attribution_expires_at timestamp without time zone,
    referrer character varying(1000),
    country character varying(100),
    city character varying(100),
    created_at timestamp without time zone NOT NULL
);


--
-- Name: COLUMN qr_scans.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.id IS 'Primary key (SCN prefix)';


--
-- Name: COLUMN qr_scans.qr_code_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.qr_code_id IS 'FK to qr_codes';


--
-- Name: COLUMN qr_scans.scanned_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.scanned_at IS 'When the scan occurred';


--
-- Name: COLUMN qr_scans.device_fingerprint; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.device_fingerprint IS 'Device fingerprint for deduplication';


--
-- Name: COLUMN qr_scans.ip_address; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.ip_address IS 'IP address of scanner';


--
-- Name: COLUMN qr_scans.user_agent; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.user_agent IS 'Browser user agent';


--
-- Name: COLUMN qr_scans.session_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.session_id IS 'Session ID for attribution tracking';


--
-- Name: COLUMN qr_scans.attribution_expires_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.attribution_expires_at IS 'Attribution window expiration (30 days from scan)';


--
-- Name: COLUMN qr_scans.referrer; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.referrer IS 'Referrer URL';


--
-- Name: COLUMN qr_scans.country; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.country IS 'Country from IP geolocation';


--
-- Name: COLUMN qr_scans.city; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.city IS 'City from IP geolocation';


--
-- Name: COLUMN qr_scans.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.qr_scans.created_at IS 'Creation timestamp';


--
-- Name: qrc_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.qrc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rak_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rak_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rec_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rec_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rfid_scan_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rfid_scan_logs (
    id character varying(50) NOT NULL,
    epc character varying(24) NOT NULL,
    tag_id character varying(50),
    product_id character varying(50),
    device_id character varying(100),
    device_name character varying(255),
    device_type character varying(50),
    location character varying(255),
    latitude numeric(10,8),
    longitude numeric(11,8),
    ip_address character varying(50),
    user_agent text,
    user_id character varying(50),
    session_id character varying(100),
    is_known_tag boolean DEFAULT false NOT NULL,
    scan_type character varying(50),
    scanned_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: rfid_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rfid_tags (
    id character varying(50) NOT NULL,
    epc character varying(50) NOT NULL,
    product_id character varying(50) NOT NULL,
    print_job_id character varying(50),
    print_job_item_id character varying(50),
    status character varying(50) DEFAULT 'ACTIVE'::character varying NOT NULL,
    scan_count integer DEFAULT 0 NOT NULL,
    last_scanned_at timestamp with time zone,
    last_scanned_device character varying(100),
    last_scanned_location character varying(255),
    encoded_at timestamp with time zone NOT NULL,
    voided_at timestamp with time zone,
    voided_reason text,
    voided_by character varying(50),
    metadata jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: rft_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rft_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_matrix; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_matrix (
    id bigint NOT NULL,
    role_name character varying(50) NOT NULL,
    purpose character varying(255) NOT NULL,
    ui_tabs text,
    key_actions text,
    last_updated timestamp without time zone DEFAULT now()
);


--
-- Name: role_matrix_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.role_matrix ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.role_matrix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: role_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.role_permissions (
    role_id bigint NOT NULL,
    permission_id bigint NOT NULL
);


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(255),
    active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by character varying(50),
    updated_by character varying(50)
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: rsl_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rsl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: s3_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.s3_files (
    id character varying(50) NOT NULL,
    original_filename character varying(255) NOT NULL,
    s3_key character varying(500) NOT NULL,
    s3_bucket character varying(255) NOT NULL,
    content_type character varying(100),
    file_size bigint,
    e_tag character varying(255),
    description character varying(500),
    is_active boolean DEFAULT true NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by character varying(100),
    updated_by character varying(100),
    folder_path character varying(1000)
);


--
-- Name: scn_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.scn_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: side_stones_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.side_stones_options (
    id bigint NOT NULL,
    stone_code character varying(20) NOT NULL,
    stone_type character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: side_stones_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.side_stones_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.side_stones_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sku_prefix_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sku_prefix_options (
    id bigint NOT NULL,
    prefix_code character varying(20) NOT NULL,
    prefix_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sku_prefix_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.sku_prefix_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.sku_prefix_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: sku_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sku_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slt_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.slt_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stock_reconciliation_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_reconciliation_records (
    id character varying(255) NOT NULL,
    document_number character varying(100) NOT NULL,
    warehouse_id character varying(100),
    warehouse_name character varying(255),
    reconciliation_date timestamp without time zone NOT NULL,
    created_by character varying(255),
    created_by_name character varying(255),
    summary jsonb,
    items_data jsonb,
    report_file_key character varying(500),
    report_file_name character varying(255),
    report_file_url character varying(1000),
    notes character varying(2000),
    total_items integer,
    matched_items integer,
    missing_items integer,
    excess_items integer,
    not_in_system_items integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN stock_reconciliation_records.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.id IS 'Primary key (REC prefix)';


--
-- Name: COLUMN stock_reconciliation_records.document_number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.document_number IS 'Document number (e.g., KK-1704700000000)';


--
-- Name: COLUMN stock_reconciliation_records.warehouse_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.warehouse_id IS 'MISA warehouse ID';


--
-- Name: COLUMN stock_reconciliation_records.warehouse_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.warehouse_name IS 'Warehouse name';


--
-- Name: COLUMN stock_reconciliation_records.reconciliation_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.reconciliation_date IS 'Date/time of reconciliation';


--
-- Name: COLUMN stock_reconciliation_records.created_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.created_by IS 'User ID who created the record';


--
-- Name: COLUMN stock_reconciliation_records.created_by_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.created_by_name IS 'User name who created the record';


--
-- Name: COLUMN stock_reconciliation_records.summary; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.summary IS 'Summary statistics (total, match, missing, excess, notInMisa)';


--
-- Name: COLUMN stock_reconciliation_records.items_data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.items_data IS 'Full reconciliation items data';


--
-- Name: COLUMN stock_reconciliation_records.report_file_key; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.report_file_key IS 'R2/S3 file key for DOCX report';


--
-- Name: COLUMN stock_reconciliation_records.report_file_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.report_file_name IS 'Original report file name';


--
-- Name: COLUMN stock_reconciliation_records.report_file_url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.report_file_url IS 'Public URL for report download';


--
-- Name: COLUMN stock_reconciliation_records.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.notes IS 'Additional notes';


--
-- Name: COLUMN stock_reconciliation_records.total_items; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.total_items IS 'Total number of items in reconciliation';


--
-- Name: COLUMN stock_reconciliation_records.matched_items; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.matched_items IS 'Number of items that matched';


--
-- Name: COLUMN stock_reconciliation_records.missing_items; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.missing_items IS 'Number of items missing (physical less than system)';


--
-- Name: COLUMN stock_reconciliation_records.excess_items; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.excess_items IS 'Number of items in excess (physical greater than system)';


--
-- Name: COLUMN stock_reconciliation_records.not_in_system_items; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.not_in_system_items IS 'Number of items not found in MISA system';


--
-- Name: COLUMN stock_reconciliation_records.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.created_at IS 'Creation timestamp';


--
-- Name: COLUMN stock_reconciliation_records.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN stock_reconciliation_records.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN stock_reconciliation_records.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.stock_reconciliation_records.is_active IS 'Active status flag';


--
-- Name: stone_origin_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stone_origin_options (
    id bigint NOT NULL,
    origin_code character varying(20) NOT NULL,
    origin_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: stone_origin_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.stone_origin_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.stone_origin_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stone_role_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stone_role_options (
    id bigint NOT NULL,
    role_code character varying(20) NOT NULL,
    role_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: stone_role_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.stone_role_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.stone_role_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stone_shape_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stone_shape_options (
    id bigint NOT NULL,
    shape_code character varying(20) NOT NULL,
    shape_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    image character varying(255),
    gif character varying(255),
    price integer DEFAULT 0,
    heads text
);


--
-- Name: stone_shape_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.stone_shape_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.stone_shape_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stone_type_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stone_type_options (
    id bigint NOT NULL,
    type_code character varying(20) NOT NULL,
    type_name character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: stone_type_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.stone_type_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.stone_type_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: stone_weight_options; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stone_weight_options (
    id bigint NOT NULL,
    weight_code character varying(20) NOT NULL,
    weight_range character varying(100) NOT NULL,
    description character varying(255),
    display_order integer DEFAULT 0,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: stone_weight_options_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.stone_weight_options ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.stone_weight_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_otps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_otps (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    email character varying(255) NOT NULL,
    otp character varying(6) NOT NULL,
    type character varying(50) NOT NULL,
    verified_at timestamp without time zone,
    attempt_count integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    expiration_seconds bigint DEFAULT 300 NOT NULL
);


--
-- Name: user_otps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.user_otps ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.user_otps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    phone_number character varying(20),
    enabled boolean DEFAULT true NOT NULL,
    account_non_expired boolean DEFAULT true NOT NULL,
    account_non_locked boolean DEFAULT true NOT NULL,
    credentials_non_expired boolean DEFAULT true NOT NULL,
    failed_login_attempts integer DEFAULT 0,
    last_login timestamp without time zone,
    password_changed_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    created_by character varying(50),
    updated_by character varying(50),
    title character varying(3),
    date_of_birth date,
    nationality character varying(50),
    email_verified boolean DEFAULT false NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ven_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ven_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vendor_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendor_products (
    id character varying(255) NOT NULL,
    vendor_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    commission_term text,
    is_active boolean DEFAULT true NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: vendors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vendors (
    id character varying(255) NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(200) NOT NULL,
    country character varying(100) NOT NULL,
    country_of_origin character varying(100),
    payment_terms character varying(200),
    commission_term text,
    import_tax_percent numeric(5,2),
    vat_tax_percent numeric(5,2),
    tax_customs_percent numeric(5,2),
    shipping_fee numeric(10,2),
    avg_labor_cost_per_piece numeric(10,2),
    avg_product_cost numeric(10,2),
    last_quote_date timestamp without time zone,
    production_lead_time_days integer,
    vendor_type character varying(50),
    labor_cost_factors text,
    contact_person character varying(200),
    contact_email character varying(200),
    contact_phone character varying(50),
    address text,
    is_active boolean DEFAULT true NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    owner_user_id character varying(50)
);


--
-- Name: vpr_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vpr_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: warehouse_racks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.warehouse_racks (
    id character varying(255) NOT NULL,
    warehouse_id character varying(255) NOT NULL,
    rack_code character varying(50) NOT NULL,
    rack_name character varying(255),
    floor_level integer DEFAULT 1 NOT NULL,
    row_position character varying(10),
    column_position character varying(10),
    description text,
    slot_capacity integer,
    current_slot_count integer DEFAULT 0 NOT NULL,
    rack_type character varying(50),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN warehouse_racks.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.id IS 'Primary key (RAK prefix)';


--
-- Name: COLUMN warehouse_racks.warehouse_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.warehouse_id IS 'FK to locations table (WAREHOUSE type)';


--
-- Name: COLUMN warehouse_racks.rack_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.rack_code IS 'Rack identifier code (e.g., A1, B2, C3)';


--
-- Name: COLUMN warehouse_racks.rack_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.rack_name IS 'Human-readable rack name';


--
-- Name: COLUMN warehouse_racks.floor_level; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.floor_level IS 'Floor level (1 = ground floor)';


--
-- Name: COLUMN warehouse_racks.row_position; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.row_position IS 'Row position identifier (e.g., A, B, C)';


--
-- Name: COLUMN warehouse_racks.column_position; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.column_position IS 'Column position identifier (e.g., 1, 2, 3)';


--
-- Name: COLUMN warehouse_racks.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.description IS 'Additional description or notes';


--
-- Name: COLUMN warehouse_racks.slot_capacity; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.slot_capacity IS 'Maximum number of slots this rack can hold';


--
-- Name: COLUMN warehouse_racks.current_slot_count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.current_slot_count IS 'Current number of slots';


--
-- Name: COLUMN warehouse_racks.rack_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.rack_type IS 'Type: JEWELRY, DIAMOND, GENERAL, MIXED';


--
-- Name: COLUMN warehouse_racks.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.created_at IS 'Creation timestamp';


--
-- Name: COLUMN warehouse_racks.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN warehouse_racks.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN warehouse_racks.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_racks.is_active IS 'Active status flag';


--
-- Name: warehouse_slots; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.warehouse_slots (
    id character varying(255) NOT NULL,
    rack_id character varying(255) NOT NULL,
    slot_code character varying(50) NOT NULL,
    slot_name character varying(255),
    slot_type character varying(50),
    slot_size character varying(20),
    row_in_rack integer,
    column_in_rack integer,
    is_occupied boolean DEFAULT false NOT NULL,
    current_product_code character varying(30),
    occupied_at timestamp without time zone,
    occupied_by character varying(255),
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN warehouse_slots.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.id IS 'Primary key (SLT prefix)';


--
-- Name: COLUMN warehouse_slots.rack_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.rack_id IS 'FK to warehouse_racks table';


--
-- Name: COLUMN warehouse_slots.slot_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.slot_code IS 'Slot identifier code (e.g., 01, 02, A1)';


--
-- Name: COLUMN warehouse_slots.slot_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.slot_name IS 'Human-readable slot name or label';


--
-- Name: COLUMN warehouse_slots.slot_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.slot_type IS 'Type: JEWELRY, DIAMOND, RING, NECKLACE, BRACELET, EARRING, GENERAL';


--
-- Name: COLUMN warehouse_slots.slot_size; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.slot_size IS 'Size category: SMALL, MEDIUM, LARGE';


--
-- Name: COLUMN warehouse_slots.row_in_rack; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.row_in_rack IS 'Row position within the rack (vertical)';


--
-- Name: COLUMN warehouse_slots.column_in_rack; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.column_in_rack IS 'Column position within the rack (horizontal)';


--
-- Name: COLUMN warehouse_slots.is_occupied; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.is_occupied IS 'Whether slot currently holds an item';


--
-- Name: COLUMN warehouse_slots.current_product_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.current_product_code IS 'SKU code of item currently in this slot';


--
-- Name: COLUMN warehouse_slots.occupied_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.occupied_at IS 'When the current item was placed';


--
-- Name: COLUMN warehouse_slots.occupied_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.occupied_by IS 'User ID who placed the item';


--
-- Name: COLUMN warehouse_slots.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.notes IS 'Additional notes';


--
-- Name: COLUMN warehouse_slots.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.created_at IS 'Creation timestamp';


--
-- Name: COLUMN warehouse_slots.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN warehouse_slots.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN warehouse_slots.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.warehouse_slots.is_active IS 'Active status flag';


--
-- Name: wfs_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wfs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wft_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wft_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: who_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.who_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wholesale_order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wholesale_order_items (
    id character varying(255) NOT NULL,
    order_id character varying(255) NOT NULL,
    product_id character varying(255) NOT NULL,
    quantity integer NOT NULL,
    retail_price numeric(15,2) NOT NULL,
    wholesale_price numeric(15,2) NOT NULL,
    discount_percent numeric(5,2) DEFAULT 0 NOT NULL,
    line_total numeric(15,2) NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN wholesale_order_items.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.id IS 'Primary key (WOI prefix)';


--
-- Name: COLUMN wholesale_order_items.order_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.order_id IS 'Reference to wholesale_orders';


--
-- Name: COLUMN wholesale_order_items.product_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.product_id IS 'Reference to mirror_products';


--
-- Name: COLUMN wholesale_order_items.quantity; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.quantity IS 'Quantity ordered';


--
-- Name: COLUMN wholesale_order_items.retail_price; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.retail_price IS 'Mirror retail price at time of order';


--
-- Name: COLUMN wholesale_order_items.wholesale_price; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.wholesale_price IS 'Wholesale price for partner';


--
-- Name: COLUMN wholesale_order_items.discount_percent; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.discount_percent IS 'Additional line discount';


--
-- Name: COLUMN wholesale_order_items.line_total; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.line_total IS 'Line total (wholesale_price * quantity - discount)';


--
-- Name: COLUMN wholesale_order_items.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.notes IS 'Item notes';


--
-- Name: COLUMN wholesale_order_items.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.created_at IS 'Creation timestamp';


--
-- Name: COLUMN wholesale_order_items.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN wholesale_order_items.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN wholesale_order_items.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_order_items.is_active IS 'Active status flag';


--
-- Name: wholesale_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wholesale_orders (
    id character varying(255) NOT NULL,
    order_number character varying(30) NOT NULL,
    partner_id character varying(255) NOT NULL,
    status character varying(20) DEFAULT 'DRAFT'::character varying NOT NULL,
    subtotal numeric(15,2) DEFAULT 0 NOT NULL,
    discount_amount numeric(15,2) DEFAULT 0 NOT NULL,
    tax_amount numeric(15,2) DEFAULT 0 NOT NULL,
    total_amount numeric(15,2) DEFAULT 0 NOT NULL,
    currency character varying(3) DEFAULT 'VND'::character varying NOT NULL,
    shipping_address text,
    shipping_method character varying(50),
    shipping_cost numeric(15,2) DEFAULT 0 NOT NULL,
    tracking_number character varying(100),
    submitted_at timestamp without time zone,
    approved_at timestamp without time zone,
    approved_by character varying(100),
    shipped_at timestamp without time zone,
    delivered_at timestamp without time zone,
    completed_at timestamp without time zone,
    cancelled_at timestamp without time zone,
    cancelled_by character varying(100),
    cancellation_reason text,
    payment_method character varying(50),
    payment_reference character varying(100),
    payment_status character varying(20) DEFAULT 'UNPAID'::character varying NOT NULL,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: COLUMN wholesale_orders.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.id IS 'Primary key (WHO prefix)';


--
-- Name: COLUMN wholesale_orders.order_number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.order_number IS 'Human-readable order number';


--
-- Name: COLUMN wholesale_orders.partner_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.partner_id IS 'Reference to pod_partners';


--
-- Name: COLUMN wholesale_orders.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.status IS 'Order status';


--
-- Name: COLUMN wholesale_orders.subtotal; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.subtotal IS 'Sum of line items';


--
-- Name: COLUMN wholesale_orders.discount_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.discount_amount IS 'Total discount';


--
-- Name: COLUMN wholesale_orders.tax_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.tax_amount IS 'Tax amount';


--
-- Name: COLUMN wholesale_orders.total_amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.total_amount IS 'Final total';


--
-- Name: COLUMN wholesale_orders.currency; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.currency IS 'Currency code';


--
-- Name: COLUMN wholesale_orders.shipping_address; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.shipping_address IS 'Delivery address';


--
-- Name: COLUMN wholesale_orders.shipping_method; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.shipping_method IS 'Shipping method';


--
-- Name: COLUMN wholesale_orders.shipping_cost; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.shipping_cost IS 'Shipping cost';


--
-- Name: COLUMN wholesale_orders.tracking_number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.tracking_number IS 'Shipment tracking number';


--
-- Name: COLUMN wholesale_orders.submitted_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.submitted_at IS 'When order was submitted';


--
-- Name: COLUMN wholesale_orders.approved_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.approved_at IS 'When order was approved';


--
-- Name: COLUMN wholesale_orders.approved_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.approved_by IS 'Who approved the order';


--
-- Name: COLUMN wholesale_orders.shipped_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.shipped_at IS 'When order was shipped';


--
-- Name: COLUMN wholesale_orders.delivered_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.delivered_at IS 'When order was delivered';


--
-- Name: COLUMN wholesale_orders.completed_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.completed_at IS 'When order was completed';


--
-- Name: COLUMN wholesale_orders.cancelled_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.cancelled_at IS 'When order was cancelled';


--
-- Name: COLUMN wholesale_orders.cancelled_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.cancelled_by IS 'Who cancelled the order';


--
-- Name: COLUMN wholesale_orders.cancellation_reason; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.cancellation_reason IS 'Reason for cancellation';


--
-- Name: COLUMN wholesale_orders.payment_method; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.payment_method IS 'Payment method';


--
-- Name: COLUMN wholesale_orders.payment_reference; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.payment_reference IS 'Payment reference number';


--
-- Name: COLUMN wholesale_orders.payment_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.payment_status IS 'Payment status';


--
-- Name: COLUMN wholesale_orders.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.notes IS 'Order notes';


--
-- Name: COLUMN wholesale_orders.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.created_at IS 'Creation timestamp';


--
-- Name: COLUMN wholesale_orders.updated_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.updated_at IS 'Last update timestamp';


--
-- Name: COLUMN wholesale_orders.is_deleted; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.is_deleted IS 'Soft delete flag';


--
-- Name: COLUMN wholesale_orders.is_active; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.wholesale_orders.is_active IS 'Active status flag';


--
-- Name: woi_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.woi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflow_stage_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workflow_stage_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflow_stages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workflow_stages (
    id character varying(36) NOT NULL,
    template_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    stage_order integer NOT NULL,
    required_capability character varying(30),
    estimated_duration_days integer,
    instructions text,
    is_final_stage boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT chk_wfs_duration_positive CHECK (((estimated_duration_days IS NULL) OR (estimated_duration_days >= 0))),
    CONSTRAINT chk_wfs_stage_order_positive CHECK ((stage_order > 0))
);


--
-- Name: workflow_template_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.workflow_template_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workflow_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workflow_templates (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    category character varying(50),
    is_default boolean DEFAULT false NOT NULL,
    status character varying(20) DEFAULT 'DRAFT'::character varying NOT NULL,
    created_by character varying(100),
    updated_by character varying(100),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    is_deleted boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT chk_wft_status CHECK (((status)::text = ANY (ARRAY[('DRAFT'::character varying)::text, ('ACTIVE'::character varying)::text, ('ARCHIVED'::character varying)::text])))
);


--
-- Name: age_group_preferences age_group_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.age_group_preferences
    ADD CONSTRAINT age_group_preferences_pkey PRIMARY KEY (id);


--
-- Name: age_groups age_groups_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.age_groups
    ADD CONSTRAINT age_groups_name_key UNIQUE (name);


--
-- Name: age_groups age_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.age_groups
    ADD CONSTRAINT age_groups_pkey PRIMARY KEY (id);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: band_style_options band_style_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.band_style_options
    ADD CONSTRAINT band_style_options_pkey PRIMARY KEY (id);


--
-- Name: band_style_options band_style_options_style_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.band_style_options
    ADD CONSTRAINT band_style_options_style_code_key UNIQUE (style_code);


--
-- Name: blocked_slots blocked_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_slots
    ADD CONSTRAINT blocked_slots_pkey PRIMARY KEY (id);


--
-- Name: certificates certificates_certificate_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_certificate_code_key UNIQUE (certificate_code);


--
-- Name: certificates certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.certificates
    ADD CONSTRAINT certificates_pkey PRIMARY KEY (id);


--
-- Name: clarity_grade_options clarity_grade_options_clarity_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clarity_grade_options
    ADD CONSTRAINT clarity_grade_options_clarity_code_key UNIQUE (clarity_code);


--
-- Name: clarity_grade_options clarity_grade_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clarity_grade_options
    ADD CONSTRAINT clarity_grade_options_pkey PRIMARY KEY (id);


--
-- Name: collection_age_group_allocations collection_age_group_allocations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_age_group_allocations
    ADD CONSTRAINT collection_age_group_allocations_pkey PRIMARY KEY (id);


--
-- Name: collection_plan_items collection_plan_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_plan_items
    ADD CONSTRAINT collection_plan_items_pkey PRIMARY KEY (id);


--
-- Name: collection_plans collection_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_plans
    ADD CONSTRAINT collection_plans_pkey PRIMARY KEY (id);


--
-- Name: collection_products collection_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_products
    ADD CONSTRAINT collection_products_pkey PRIMARY KEY (id);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- Name: color_grade_options color_grade_options_grade_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.color_grade_options
    ADD CONSTRAINT color_grade_options_grade_code_key UNIQUE (grade_code);


--
-- Name: color_grade_options color_grade_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.color_grade_options
    ADD CONSTRAINT color_grade_options_pkey PRIMARY KEY (id);


--
-- Name: component_optionals component_optionals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.component_optionals
    ADD CONSTRAINT component_optionals_pkey PRIMARY KEY (id);


--
-- Name: component_ownership_logs component_ownership_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.component_ownership_logs
    ADD CONSTRAINT component_ownership_logs_pkey PRIMARY KEY (id);


--
-- Name: components components_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);


--
-- Name: country_of_origin_options country_of_origin_options_country_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country_of_origin_options
    ADD CONSTRAINT country_of_origin_options_country_code_key UNIQUE (country_code);


--
-- Name: country_of_origin_options country_of_origin_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country_of_origin_options
    ADD CONSTRAINT country_of_origin_options_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: design_products design_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.design_products
    ADD CONSTRAINT design_products_pkey PRIMARY KEY (id);


--
-- Name: design_products design_products_product_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.design_products
    ADD CONSTRAINT design_products_product_id_key UNIQUE (product_id);


--
-- Name: design_sale_transactions design_sale_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.design_sale_transactions
    ADD CONSTRAINT design_sale_transactions_pkey PRIMARY KEY (id);


--
-- Name: designers designers_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designers
    ADD CONSTRAINT designers_code_key UNIQUE (code);


--
-- Name: designers designers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.designers
    ADD CONSTRAINT designers_pkey PRIMARY KEY (id);


--
-- Name: email_verification_tokens email_verification_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_verification_tokens
    ADD CONSTRAINT email_verification_tokens_pkey PRIMARY KEY (id);


--
-- Name: email_verification_tokens email_verification_tokens_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_verification_tokens
    ADD CONSTRAINT email_verification_tokens_token_key UNIQUE (token);


--
-- Name: id_sequences id_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.id_sequences
    ADD CONSTRAINT id_sequences_pkey PRIMARY KEY (entity_type);


--
-- Name: inventory_movements inventory_movements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_movements
    ADD CONSTRAINT inventory_movements_pkey PRIMARY KEY (id);


--
-- Name: inventory_position_history inventory_position_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_position_history
    ADD CONSTRAINT inventory_position_history_pkey PRIMARY KEY (id);


--
-- Name: inventory_positions inventory_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_positions
    ADD CONSTRAINT inventory_positions_pkey PRIMARY KEY (id);


--
-- Name: item_variant_configs item_variant_configs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_variant_configs
    ADD CONSTRAINT item_variant_configs_pkey PRIMARY KEY (id);


--
-- Name: item_variants item_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_variants
    ADD CONSTRAINT item_variants_pkey PRIMARY KEY (id);


--
-- Name: jewelry_technical_reports jewelry_technical_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jewelry_technical_reports
    ADD CONSTRAINT jewelry_technical_reports_pkey PRIMARY KEY (id);


--
-- Name: jewelry_technical_reports jewelry_technical_reports_report_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jewelry_technical_reports
    ADD CONSTRAINT jewelry_technical_reports_report_number_key UNIQUE (report_number);


--
-- Name: jtrc_labor_components jtrc_labor_components_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jtrc_labor_components
    ADD CONSTRAINT jtrc_labor_components_pkey PRIMARY KEY (id);


--
-- Name: jtrc_metal_components jtrc_metal_components_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jtrc_metal_components
    ADD CONSTRAINT jtrc_metal_components_pkey PRIMARY KEY (id);


--
-- Name: jtrc_stone_components jtrc_stone_components_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jtrc_stone_components
    ADD CONSTRAINT jtrc_stone_components_pkey PRIMARY KEY (id);


--
-- Name: mirror_diamonds lab_grown_diamonds_cert_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mirror_diamonds
    ADD CONSTRAINT lab_grown_diamonds_cert_number_key UNIQUE (cert_number);


--
-- Name: mirror_diamonds lab_grown_diamonds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mirror_diamonds
    ADD CONSTRAINT lab_grown_diamonds_pkey PRIMARY KEY (id);


--
-- Name: mirror_diamonds lab_grown_diamonds_sku_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mirror_diamonds
    ADD CONSTRAINT lab_grown_diamonds_sku_code_key UNIQUE (sku_code);


--
-- Name: label_templates label_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.label_templates
    ADD CONSTRAINT label_templates_pkey PRIMARY KEY (id);


--
-- Name: labor_type_options labor_type_options_labor_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.labor_type_options
    ADD CONSTRAINT labor_type_options_labor_code_key UNIQUE (labor_code);


--
-- Name: labor_type_options labor_type_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.labor_type_options
    ADD CONSTRAINT labor_type_options_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: market_trends market_trends_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.market_trends
    ADD CONSTRAINT market_trends_pkey PRIMARY KEY (id);


--
-- Name: market_trends market_trends_trend_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.market_trends
    ADD CONSTRAINT market_trends_trend_code_key UNIQUE (trend_code);


--
-- Name: material_color_options material_color_options_color_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_color_options
    ADD CONSTRAINT material_color_options_color_code_key UNIQUE (color_code);


--
-- Name: material_color_options material_color_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_color_options
    ADD CONSTRAINT material_color_options_pkey PRIMARY KEY (id);


--
-- Name: material_inventory material_inventory_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_inventory
    ADD CONSTRAINT material_inventory_name_key UNIQUE (name);


--
-- Name: material_inventory material_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_inventory
    ADD CONSTRAINT material_inventory_pkey PRIMARY KEY (id);


--
-- Name: material_options material_options_material_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_options
    ADD CONSTRAINT material_options_material_code_key UNIQUE (material_code);


--
-- Name: material_options material_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_options
    ADD CONSTRAINT material_options_pkey PRIMARY KEY (id);


--
-- Name: metal_purity_options metal_purity_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metal_purity_options
    ADD CONSTRAINT metal_purity_options_pkey PRIMARY KEY (id);


--
-- Name: metal_purity_options metal_purity_options_purity_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metal_purity_options
    ADD CONSTRAINT metal_purity_options_purity_code_key UNIQUE (purity_code);


--
-- Name: metal_type_options metal_type_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metal_type_options
    ADD CONSTRAINT metal_type_options_pkey PRIMARY KEY (id);


--
-- Name: metal_type_options metal_type_options_type_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metal_type_options
    ADD CONSTRAINT metal_type_options_type_code_key UNIQUE (type_code);


--
-- Name: mirror_products mirror_products_barcode_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mirror_products
    ADD CONSTRAINT mirror_products_barcode_key UNIQUE (barcode);


--
-- Name: mirror_products mirror_products_mirror_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mirror_products
    ADD CONSTRAINT mirror_products_mirror_code_key UNIQUE (mirror_code);


--
-- Name: mirror_products mirror_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mirror_products
    ADD CONSTRAINT mirror_products_pkey PRIMARY KEY (id);


--
-- Name: misa_balance_trackers misa_balance_trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_balance_trackers
    ADD CONSTRAINT misa_balance_trackers_pkey PRIMARY KEY (id);


--
-- Name: misa_callback_logs misa_callback_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_callback_logs
    ADD CONSTRAINT misa_callback_logs_pkey PRIMARY KEY (id);


--
-- Name: misa_customers misa_customers_customer_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_customers
    ADD CONSTRAINT misa_customers_customer_id_key UNIQUE (customer_id);


--
-- Name: misa_customers misa_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_customers
    ADD CONSTRAINT misa_customers_pkey PRIMARY KEY (id);


--
-- Name: misa_inventory_items misa_inventory_items_inventory_item_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_inventory_items
    ADD CONSTRAINT misa_inventory_items_inventory_item_code_key UNIQUE (inventory_item_code);


--
-- Name: misa_inventory_items misa_inventory_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_inventory_items
    ADD CONSTRAINT misa_inventory_items_pkey PRIMARY KEY (id);


--
-- Name: misa_invoices misa_invoices_invoice_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_invoices
    ADD CONSTRAINT misa_invoices_invoice_id_key UNIQUE (invoice_id);


--
-- Name: misa_invoices misa_invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_invoices
    ADD CONSTRAINT misa_invoices_pkey PRIMARY KEY (id);


--
-- Name: misa_product_categories misa_product_categories_category_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_product_categories
    ADD CONSTRAINT misa_product_categories_category_id_key UNIQUE (category_id);


--
-- Name: misa_product_categories misa_product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_product_categories
    ADD CONSTRAINT misa_product_categories_pkey PRIMARY KEY (id);


--
-- Name: misa_sync_logs misa_sync_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_sync_logs
    ADD CONSTRAINT misa_sync_logs_pkey PRIMARY KEY (id);


--
-- Name: misa_warehouses misa_warehouses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_warehouses
    ADD CONSTRAINT misa_warehouses_pkey PRIMARY KEY (id);


--
-- Name: misa_warehouses misa_warehouses_stock_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_warehouses
    ADD CONSTRAINT misa_warehouses_stock_code_key UNIQUE (stock_code);


--
-- Name: misa_warehouses misa_warehouses_stock_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_warehouses
    ADD CONSTRAINT misa_warehouses_stock_id_key UNIQUE (stock_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: order_payment_schedule order_payment_schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payment_schedule
    ADD CONSTRAINT order_payment_schedule_pkey PRIMARY KEY (id);


--
-- Name: order_payment_transactions order_payment_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payment_transactions
    ADD CONSTRAINT order_payment_transactions_pkey PRIMARY KEY (id);


--
-- Name: order_status_history order_status_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_status_history
    ADD CONSTRAINT order_status_history_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: partner_capabilities partner_capabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_capabilities
    ADD CONSTRAINT partner_capabilities_pkey PRIMARY KEY (id);


--
-- Name: partner_inventory partner_inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_inventory
    ADD CONSTRAINT partner_inventory_pkey PRIMARY KEY (id);


--
-- Name: partner_sale_items partner_sale_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_sale_items
    ADD CONSTRAINT partner_sale_items_pkey PRIMARY KEY (id);


--
-- Name: partner_sales partner_sales_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_sales
    ADD CONSTRAINT partner_sales_pkey PRIMARY KEY (id);


--
-- Name: partner_sales partner_sales_sale_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_sales
    ADD CONSTRAINT partner_sales_sale_number_key UNIQUE (sale_number);


--
-- Name: permissions permissions_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_name_key UNIQUE (name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: role_matrix pk_role_matrix; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_matrix
    ADD CONSTRAINT pk_role_matrix PRIMARY KEY (id);


--
-- Name: pod_attributions pod_attributions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_attributions
    ADD CONSTRAINT pod_attributions_pkey PRIMARY KEY (id);


--
-- Name: pod_commissions pod_commissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_commissions
    ADD CONSTRAINT pod_commissions_pkey PRIMARY KEY (id);


--
-- Name: pod_partners pod_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_partners
    ADD CONSTRAINT pod_partners_pkey PRIMARY KEY (id);


--
-- Name: pod_products pod_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_products
    ADD CONSTRAINT pod_products_pkey PRIMARY KEY (id);


--
-- Name: pod_qr_codes pod_qr_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_qr_codes
    ADD CONSTRAINT pod_qr_codes_pkey PRIMARY KEY (id);


--
-- Name: pod_qr_codes pod_qr_codes_short_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_qr_codes
    ADD CONSTRAINT pod_qr_codes_short_code_key UNIQUE (short_code);


--
-- Name: pod_qr_scans pod_qr_scans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_qr_scans
    ADD CONSTRAINT pod_qr_scans_pkey PRIMARY KEY (id);


--
-- Name: pod_user_attributions pod_user_attributions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_user_attributions
    ADD CONSTRAINT pod_user_attributions_pkey PRIMARY KEY (id);


--
-- Name: pods pods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pods
    ADD CONSTRAINT pods_pkey PRIMARY KEY (id);


--
-- Name: print_job_items print_job_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_job_items
    ADD CONSTRAINT print_job_items_pkey PRIMARY KEY (id);


--
-- Name: print_jobs print_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_jobs
    ADD CONSTRAINT print_jobs_pkey PRIMARY KEY (id);


--
-- Name: product_certificates product_certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_certificates
    ADD CONSTRAINT product_certificates_pkey PRIMARY KEY (id);


--
-- Name: product_finder_combinations product_finder_combinations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_finder_combinations
    ADD CONSTRAINT product_finder_combinations_pkey PRIMARY KEY (id);


--
-- Name: product_finder_selections product_finder_selections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_finder_selections
    ADD CONSTRAINT product_finder_selections_pkey PRIMARY KEY (id);


--
-- Name: product_finder_side_stone_options product_finder_side_stone_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_finder_side_stone_options
    ADD CONSTRAINT product_finder_side_stone_options_pkey PRIMARY KEY (id);


--
-- Name: product_finder_side_stone_options product_finder_side_stone_options_stone_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_finder_side_stone_options
    ADD CONSTRAINT product_finder_side_stone_options_stone_code_key UNIQUE (stone_code);


--
-- Name: production_order_stages production_order_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_order_stages
    ADD CONSTRAINT production_order_stages_pkey PRIMARY KEY (id);


--
-- Name: production_orders production_orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT production_orders_order_number_key UNIQUE (order_number);


--
-- Name: production_orders production_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT production_orders_pkey PRIMARY KEY (id);


--
-- Name: production_plans production_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_plans
    ADD CONSTRAINT production_plans_pkey PRIMARY KEY (id);


--
-- Name: purchase_order_age_group_allocations purchase_order_age_group_allocations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_age_group_allocations
    ADD CONSTRAINT purchase_order_age_group_allocations_pkey PRIMARY KEY (id);


--
-- Name: purchase_order_item_variants purchase_order_item_variants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_item_variants
    ADD CONSTRAINT purchase_order_item_variants_pkey PRIMARY KEY (id);


--
-- Name: purchase_order_items purchase_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT purchase_order_items_pkey PRIMARY KEY (id);


--
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (id);


--
-- Name: qr_codes qr_codes_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qr_codes
    ADD CONSTRAINT qr_codes_code_key UNIQUE (code);


--
-- Name: qr_codes qr_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qr_codes
    ADD CONSTRAINT qr_codes_pkey PRIMARY KEY (id);


--
-- Name: qr_scans qr_scans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qr_scans
    ADD CONSTRAINT qr_scans_pkey PRIMARY KEY (id);


--
-- Name: rfid_scan_logs rfid_scan_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rfid_scan_logs
    ADD CONSTRAINT rfid_scan_logs_pkey PRIMARY KEY (id);


--
-- Name: rfid_tags rfid_tags_epc_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rfid_tags
    ADD CONSTRAINT rfid_tags_epc_key UNIQUE (epc);


--
-- Name: rfid_tags rfid_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rfid_tags
    ADD CONSTRAINT rfid_tags_pkey PRIMARY KEY (id);


--
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (role_id, permission_id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: s3_files s3_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.s3_files
    ADD CONSTRAINT s3_files_pkey PRIMARY KEY (id);


--
-- Name: s3_files s3_files_s3_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.s3_files
    ADD CONSTRAINT s3_files_s3_key_key UNIQUE (s3_key);


--
-- Name: side_stones_options side_stones_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.side_stones_options
    ADD CONSTRAINT side_stones_options_pkey PRIMARY KEY (id);


--
-- Name: side_stones_options side_stones_options_stone_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.side_stones_options
    ADD CONSTRAINT side_stones_options_stone_code_key UNIQUE (stone_code);


--
-- Name: sku_prefix_options sku_prefix_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sku_prefix_options
    ADD CONSTRAINT sku_prefix_options_pkey PRIMARY KEY (id);


--
-- Name: sku_prefix_options sku_prefix_options_prefix_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sku_prefix_options
    ADD CONSTRAINT sku_prefix_options_prefix_code_key UNIQUE (prefix_code);


--
-- Name: stock_reconciliation_records stock_reconciliation_records_document_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_reconciliation_records
    ADD CONSTRAINT stock_reconciliation_records_document_number_key UNIQUE (document_number);


--
-- Name: stock_reconciliation_records stock_reconciliation_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_reconciliation_records
    ADD CONSTRAINT stock_reconciliation_records_pkey PRIMARY KEY (id);


--
-- Name: stone_origin_options stone_origin_options_origin_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stone_origin_options
    ADD CONSTRAINT stone_origin_options_origin_code_key UNIQUE (origin_code);


--
-- Name: stone_origin_options stone_origin_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stone_origin_options
    ADD CONSTRAINT stone_origin_options_pkey PRIMARY KEY (id);


--
-- Name: stone_role_options stone_role_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stone_role_options
    ADD CONSTRAINT stone_role_options_pkey PRIMARY KEY (id);


--
-- Name: stone_role_options stone_role_options_role_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stone_role_options
    ADD CONSTRAINT stone_role_options_role_code_key UNIQUE (role_code);


--
-- Name: stone_shape_options stone_shape_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stone_shape_options
    ADD CONSTRAINT stone_shape_options_pkey PRIMARY KEY (id);


--
-- Name: stone_shape_options stone_shape_options_shape_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stone_shape_options
    ADD CONSTRAINT stone_shape_options_shape_code_key UNIQUE (shape_code);


--
-- Name: stone_type_options stone_type_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stone_type_options
    ADD CONSTRAINT stone_type_options_pkey PRIMARY KEY (id);


--
-- Name: stone_type_options stone_type_options_type_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stone_type_options
    ADD CONSTRAINT stone_type_options_type_code_key UNIQUE (type_code);


--
-- Name: stone_weight_options stone_weight_options_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stone_weight_options
    ADD CONSTRAINT stone_weight_options_pkey PRIMARY KEY (id);


--
-- Name: stone_weight_options stone_weight_options_weight_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stone_weight_options
    ADD CONSTRAINT stone_weight_options_weight_code_key UNIQUE (weight_code);


--
-- Name: label_templates uk_label_template_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.label_templates
    ADD CONSTRAINT uk_label_template_name UNIQUE (name);


--
-- Name: production_order_stages uk_order_stage_order; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_order_stages
    ADD CONSTRAINT uk_order_stage_order UNIQUE (production_order_id, stage_order);


--
-- Name: partner_inventory uk_partner_inventory_partner_product; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_inventory
    ADD CONSTRAINT uk_partner_inventory_partner_product UNIQUE (partner_id, product_id);


--
-- Name: product_finder_combinations uk_pfc_combination; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_finder_combinations
    ADD CONSTRAINT uk_pfc_combination UNIQUE (band_code, main_stone_code, side_stone_code);


--
-- Name: inventory_positions uk_position_product_code; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_positions
    ADD CONSTRAINT uk_position_product_code UNIQUE (product_code);


--
-- Name: product_certificates uk_product_certificate; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_certificates
    ADD CONSTRAINT uk_product_certificate UNIQUE (product_id, certificate_id);


--
-- Name: warehouse_racks uk_rack_code_per_warehouse; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse_racks
    ADD CONSTRAINT uk_rack_code_per_warehouse UNIQUE (warehouse_id, rack_code);


--
-- Name: role_matrix uk_role_matrix_role_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_matrix
    ADD CONSTRAINT uk_role_matrix_role_name UNIQUE (role_name);


--
-- Name: warehouse_slots uk_slot_code_per_rack; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse_slots
    ADD CONSTRAINT uk_slot_code_per_rack UNIQUE (rack_id, slot_code);


--
-- Name: workflow_stages uk_template_stage_name; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_stages
    ADD CONSTRAINT uk_template_stage_name UNIQUE (template_id, name);


--
-- Name: workflow_stages uk_template_stage_order; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_stages
    ADD CONSTRAINT uk_template_stage_order UNIQUE (template_id, stage_order);


--
-- Name: partner_capabilities uk_vendor_capability; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_capabilities
    ADD CONSTRAINT uk_vendor_capability UNIQUE (vendor_id, capability_type);


--
-- Name: user_otps user_otps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_otps
    ADD CONSTRAINT user_otps_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: vendor_products vendor_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_products
    ADD CONSTRAINT vendor_products_pkey PRIMARY KEY (id);


--
-- Name: vendor_products vendor_products_product_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_products
    ADD CONSTRAINT vendor_products_product_id_key UNIQUE (product_id);


--
-- Name: vendors vendors_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_code_key UNIQUE (code);


--
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- Name: warehouse_racks warehouse_racks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse_racks
    ADD CONSTRAINT warehouse_racks_pkey PRIMARY KEY (id);


--
-- Name: warehouse_slots warehouse_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse_slots
    ADD CONSTRAINT warehouse_slots_pkey PRIMARY KEY (id);


--
-- Name: wholesale_order_items wholesale_order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wholesale_order_items
    ADD CONSTRAINT wholesale_order_items_pkey PRIMARY KEY (id);


--
-- Name: wholesale_orders wholesale_orders_order_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wholesale_orders
    ADD CONSTRAINT wholesale_orders_order_number_key UNIQUE (order_number);


--
-- Name: wholesale_orders wholesale_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wholesale_orders
    ADD CONSTRAINT wholesale_orders_pkey PRIMARY KEY (id);


--
-- Name: workflow_stages workflow_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_stages
    ADD CONSTRAINT workflow_stages_pkey PRIMARY KEY (id);


--
-- Name: workflow_templates workflow_templates_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_templates
    ADD CONSTRAINT workflow_templates_name_key UNIQUE (name);


--
-- Name: workflow_templates workflow_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_templates
    ADD CONSTRAINT workflow_templates_pkey PRIMARY KEY (id);


--
-- Name: idx_age_group_preference_values_preference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_age_group_preference_values_preference_id ON public.age_group_preference_values USING btree (preference_id);


--
-- Name: idx_age_group_preferences_age_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_age_group_preferences_age_group_id ON public.age_group_preferences USING btree (age_group_id);


--
-- Name: idx_age_group_preferences_attribute_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_age_group_preferences_attribute_type ON public.age_group_preferences USING btree (attribute_type);


--
-- Name: idx_age_groups_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_age_groups_name ON public.age_groups USING btree (name);


--
-- Name: idx_appointment_customer_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_appointment_customer_email ON public.appointments USING btree (customer_email);


--
-- Name: idx_appointment_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_appointment_date ON public.appointments USING btree (appointment_date);


--
-- Name: idx_appointment_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_appointment_status ON public.appointments USING btree (status);


--
-- Name: idx_appointment_venue_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_appointment_venue_date ON public.appointments USING btree (venue_id, appointment_date);


--
-- Name: idx_attribution_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_attribution_order ON public.pod_attributions USING btree (order_id);


--
-- Name: idx_attribution_order_placed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_attribution_order_placed ON public.pod_attributions USING btree (order_placed_at);


--
-- Name: idx_attribution_partner; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_attribution_partner ON public.pod_attributions USING btree (partner_id);


--
-- Name: idx_attribution_partner_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_attribution_partner_date ON public.pod_attributions USING btree (partner_id, order_placed_at);


--
-- Name: idx_attribution_pod; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_attribution_pod ON public.pod_attributions USING btree (pod_id);


--
-- Name: idx_attribution_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_attribution_status ON public.pod_attributions USING btree (status);


--
-- Name: idx_audit_action; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audit_action ON public.audit_logs USING btree (action);


--
-- Name: idx_audit_ip; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audit_ip ON public.audit_logs USING btree (ip_address);


--
-- Name: idx_audit_timestamp; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audit_timestamp ON public.audit_logs USING btree ("timestamp");


--
-- Name: idx_audit_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_audit_user ON public.audit_logs USING btree (username);


--
-- Name: idx_balance_tracker_item_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_balance_tracker_item_code ON public.misa_balance_trackers USING btree (inventory_item_code);


--
-- Name: idx_balance_tracker_org_ref_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_balance_tracker_org_ref_id ON public.misa_balance_trackers USING btree (org_ref_id);


--
-- Name: idx_balance_tracker_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_balance_tracker_status ON public.misa_balance_trackers USING btree (status);


--
-- Name: idx_barcode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_barcode ON public.mirror_products USING btree (barcode);


--
-- Name: idx_blocked_slot_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_blocked_slot_date ON public.blocked_slots USING btree (block_date);


--
-- Name: idx_blocked_slot_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_blocked_slot_type ON public.blocked_slots USING btree (block_type);


--
-- Name: idx_blocked_slot_venue_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_blocked_slot_venue_date ON public.blocked_slots USING btree (venue_id, block_date);


--
-- Name: idx_callback_data_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_callback_data_type ON public.misa_callback_logs USING btree (data_type);


--
-- Name: idx_callback_misa_ref_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_callback_misa_ref_id ON public.misa_callback_logs USING btree (misa_ref_id);


--
-- Name: idx_callback_misa_success; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_callback_misa_success ON public.misa_callback_logs USING btree (misa_success);


--
-- Name: idx_callback_org_ref_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_callback_org_ref_id ON public.misa_callback_logs USING btree (org_ref_id);


--
-- Name: idx_callback_processed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_callback_processed ON public.misa_callback_logs USING btree (processed);


--
-- Name: idx_callback_received_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_callback_received_at ON public.misa_callback_logs USING btree (received_at);


--
-- Name: idx_certificate_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_certificate_code ON public.certificates USING btree (certificate_code);


--
-- Name: idx_certificate_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_certificate_type ON public.certificates USING btree (certificate_type);


--
-- Name: idx_col_from_vendor; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_col_from_vendor ON public.component_ownership_logs USING btree (from_vendor_id);


--
-- Name: idx_col_handoff_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_col_handoff_type ON public.component_ownership_logs USING btree (handoff_type);


--
-- Name: idx_col_initiated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_col_initiated_at ON public.component_ownership_logs USING btree (initiated_at);


--
-- Name: idx_col_pending_receipts; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_col_pending_receipts ON public.component_ownership_logs USING btree (to_vendor_id, status);


--
-- Name: idx_col_production_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_col_production_order ON public.component_ownership_logs USING btree (production_order_id);


--
-- Name: idx_col_stage; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_col_stage ON public.component_ownership_logs USING btree (stage_id);


--
-- Name: idx_col_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_col_status ON public.component_ownership_logs USING btree (status);


--
-- Name: idx_col_to_vendor; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_col_to_vendor ON public.component_ownership_logs USING btree (to_vendor_id);


--
-- Name: idx_collection_age_group_allocations_age_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_age_group_allocations_age_group_id ON public.collection_age_group_allocations USING btree (age_group_id);


--
-- Name: idx_collection_age_group_allocations_collection_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_age_group_allocations_collection_plan_id ON public.collection_age_group_allocations USING btree (collection_plan_id);


--
-- Name: idx_collection_plan_items_collection_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_plan_items_collection_plan_id ON public.collection_plan_items USING btree (collection_plan_id);


--
-- Name: idx_collection_plan_items_product_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_plan_items_product_type ON public.collection_plan_items USING btree (product_type);


--
-- Name: idx_collection_plans_deadline; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_plans_deadline ON public.collection_plans USING btree (deadline);


--
-- Name: idx_collection_plans_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_plans_name ON public.collection_plans USING btree (name);


--
-- Name: idx_collection_plans_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_plans_status ON public.collection_plans USING btree (status);


--
-- Name: idx_collection_products_collection_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_products_collection_id ON public.collection_products USING btree (collection_id);


--
-- Name: idx_collection_products_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collection_products_product_id ON public.collection_products USING btree (product_id);


--
-- Name: idx_collections_featured; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collections_featured ON public.collections USING btree (featured);


--
-- Name: idx_collections_season_year; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collections_season_year ON public.collections USING btree (season, year);


--
-- Name: idx_collections_sort_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collections_sort_order ON public.collections USING btree (sort_order);


--
-- Name: idx_collections_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_collections_status ON public.collections USING btree (status);


--
-- Name: idx_component_optionals_name_component_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_component_optionals_name_component_active ON public.component_optionals USING btree (component_optional_name, component_id, is_active, is_deleted);


--
-- Name: idx_components_name_sku_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_components_name_sku_active ON public.components USING btree (component_name, product_id, is_active, is_deleted);


--
-- Name: idx_design_products_designer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_design_products_designer_id ON public.design_products USING btree (designer_id);


--
-- Name: idx_design_products_featured; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_design_products_featured ON public.design_products USING btree (featured_design);


--
-- Name: idx_design_products_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_design_products_product_id ON public.design_products USING btree (product_id);


--
-- Name: idx_design_products_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_design_products_status ON public.design_products USING btree (design_status);


--
-- Name: idx_design_sale_transactions_design_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_design_sale_transactions_design_product_id ON public.design_sale_transactions USING btree (design_product_id);


--
-- Name: idx_design_sale_transactions_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_design_sale_transactions_order_id ON public.design_sale_transactions USING btree (order_id);


--
-- Name: idx_design_sale_transactions_processed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_design_sale_transactions_processed ON public.design_sale_transactions USING btree (processed);


--
-- Name: idx_design_sale_transactions_sale_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_design_sale_transactions_sale_date ON public.design_sale_transactions USING btree (sale_date);


--
-- Name: idx_designers_active_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_designers_active_deleted ON public.designers USING btree (is_active, is_deleted);


--
-- Name: idx_designers_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_designers_code ON public.designers USING btree (code);


--
-- Name: idx_designers_owner_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_designers_owner_user_id ON public.designers USING btree (owner_user_id);


--
-- Name: idx_designers_specialty; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_designers_specialty ON public.designers USING btree (specialty);


--
-- Name: idx_designers_verified_featured; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_designers_verified_featured ON public.designers USING btree (verified, featured);


--
-- Name: idx_inv_movements_inventory; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_inv_movements_inventory ON public.inventory_movements USING btree (inventory_id);


--
-- Name: idx_inv_movements_partner_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_inv_movements_partner_date ON public.inventory_movements USING btree (partner_id, created_at);


--
-- Name: idx_inv_movements_product; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_inv_movements_product ON public.inventory_movements USING btree (product_id);


--
-- Name: idx_item_variants_url_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_item_variants_url_active ON public.item_variants USING btree (item_variant_url, is_active, is_deleted);


--
-- Name: idx_jtrc_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jtrc_category ON public.jewelry_technical_reports USING btree (category);


--
-- Name: idx_jtrc_collection; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jtrc_collection ON public.jewelry_technical_reports USING btree (collection);


--
-- Name: idx_jtrc_labor_jtrc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jtrc_labor_jtrc_id ON public.jtrc_labor_components USING btree (jtrc_id);


--
-- Name: idx_jtrc_labor_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jtrc_labor_type ON public.jtrc_labor_components USING btree (labor_type);


--
-- Name: idx_jtrc_metal_jtrc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jtrc_metal_jtrc_id ON public.jtrc_metal_components USING btree (jtrc_id);


--
-- Name: idx_jtrc_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jtrc_product_id ON public.jewelry_technical_reports USING btree (product_id);


--
-- Name: idx_jtrc_report_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jtrc_report_number ON public.jewelry_technical_reports USING btree (report_number);


--
-- Name: idx_jtrc_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jtrc_status ON public.jewelry_technical_reports USING btree (status);


--
-- Name: idx_jtrc_stone_jtrc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jtrc_stone_jtrc_id ON public.jtrc_stone_components USING btree (jtrc_id);


--
-- Name: idx_jtrc_stone_role; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_jtrc_stone_role ON public.jtrc_stone_components USING btree (stone_role);


--
-- Name: idx_label_templates_is_default; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_label_templates_is_default ON public.label_templates USING btree (is_default);


--
-- Name: idx_label_templates_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_label_templates_name ON public.label_templates USING btree (name);


--
-- Name: idx_label_templates_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_label_templates_status ON public.label_templates USING btree (status);


--
-- Name: idx_lbt_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lbt_is_active ON public.label_templates USING btree (is_active);


--
-- Name: idx_lbt_is_default; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lbt_is_default ON public.label_templates USING btree (is_default);


--
-- Name: idx_lbt_label_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lbt_label_type ON public.label_templates USING btree (label_type);


--
-- Name: idx_lbt_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lbt_name ON public.label_templates USING btree (name);


--
-- Name: idx_lgd_carat_weight; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lgd_carat_weight ON public.mirror_diamonds USING btree (carat_weight);


--
-- Name: idx_lgd_cert_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lgd_cert_number ON public.mirror_diamonds USING btree (cert_number);


--
-- Name: idx_lgd_color_clarity; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lgd_color_clarity ON public.mirror_diamonds USING btree (color, clarity);


--
-- Name: idx_lgd_invoice; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lgd_invoice ON public.mirror_diamonds USING btree (invoice_number);


--
-- Name: idx_lgd_manufacturer; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lgd_manufacturer ON public.mirror_diamonds USING btree (manufacturer_code);


--
-- Name: idx_lgd_sku_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lgd_sku_code ON public.mirror_diamonds USING btree (sku_code);


--
-- Name: idx_lgd_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_lgd_status ON public.mirror_diamonds USING btree (status);


--
-- Name: idx_locations_city; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_locations_city ON public.locations USING btree (city);


--
-- Name: idx_locations_is_internal; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_locations_is_internal ON public.locations USING btree (is_internal);


--
-- Name: idx_locations_misa_warehouse_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_locations_misa_warehouse_id ON public.locations USING btree (misa_warehouse_id);


--
-- Name: idx_locations_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_locations_status ON public.locations USING btree (status);


--
-- Name: idx_locations_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_locations_type ON public.locations USING btree (type);


--
-- Name: idx_market_trends_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_market_trends_active ON public.market_trends USING btree (active);


--
-- Name: idx_market_trends_adoption_stage; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_market_trends_adoption_stage ON public.market_trends USING btree (adoption_stage);


--
-- Name: idx_market_trends_confidence_level; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_market_trends_confidence_level ON public.market_trends USING btree (confidence_level);


--
-- Name: idx_market_trends_period; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_market_trends_period ON public.market_trends USING btree (trend_period_start, trend_period_end);


--
-- Name: idx_market_trends_trend_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_market_trends_trend_code ON public.market_trends USING btree (trend_code);


--
-- Name: idx_market_trends_trend_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_market_trends_trend_type ON public.market_trends USING btree (trend_type);


--
-- Name: idx_material_inventory_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_material_inventory_name ON public.material_inventory USING btree (name);


--
-- Name: idx_material_inventory_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_material_inventory_type ON public.material_inventory USING btree (type);


--
-- Name: idx_material_inventory_vendor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_material_inventory_vendor_id ON public.material_inventory USING btree (vendor_id);


--
-- Name: idx_mirror_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_category ON public.mirror_products USING btree (category);


--
-- Name: idx_mirror_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_code ON public.mirror_products USING btree (mirror_code);


--
-- Name: idx_mirror_design_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_design_id ON public.mirror_products USING btree (design_id);


--
-- Name: idx_mirror_designer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_designer_id ON public.mirror_products USING btree (designer_id);


--
-- Name: idx_mirror_featured; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_featured ON public.mirror_products USING btree (featured);


--
-- Name: idx_mirror_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_is_active ON public.mirror_products USING btree (is_active);


--
-- Name: idx_mirror_is_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_is_deleted ON public.mirror_products USING btree (is_deleted);


--
-- Name: idx_mirror_misa_item_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_misa_item_code ON public.mirror_products USING btree (misa_item_code);


--
-- Name: idx_mirror_products_descriptive_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_products_descriptive_code ON public.mirror_products USING btree (descriptive_code);


--
-- Name: idx_mirror_products_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_products_is_active ON public.mirror_products USING btree (is_active);


--
-- Name: idx_mirror_products_misa_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_products_misa_category_id ON public.mirror_products USING btree (misa_category_id);


--
-- Name: idx_mirror_products_misa_inventory_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_products_misa_inventory_id ON public.mirror_products USING btree (misa_inventory_id);


--
-- Name: idx_mirror_products_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_mirror_products_status ON public.mirror_products USING btree (status);


--
-- Name: idx_misa_cat_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_cat_active ON public.misa_product_categories USING btree (is_active);


--
-- Name: idx_misa_cat_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_cat_category_id ON public.misa_product_categories USING btree (category_id);


--
-- Name: idx_misa_cat_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_cat_parent_id ON public.misa_product_categories USING btree (parent_id);


--
-- Name: idx_misa_customers_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_customers_active ON public.misa_customers USING btree (is_active);


--
-- Name: idx_misa_customers_customer_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_customers_customer_code ON public.misa_customers USING btree (customer_code);


--
-- Name: idx_misa_customers_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_customers_customer_id ON public.misa_customers USING btree (customer_id);


--
-- Name: idx_misa_customers_customer_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_customers_customer_name ON public.misa_customers USING btree (customer_name);


--
-- Name: idx_misa_customers_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_customers_email ON public.misa_customers USING btree (email);


--
-- Name: idx_misa_customers_last_sync; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_customers_last_sync ON public.misa_customers USING btree (last_sync_date);


--
-- Name: idx_misa_customers_member_level; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_customers_member_level ON public.misa_customers USING btree (member_level_id);


--
-- Name: idx_misa_customers_phone; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_customers_phone ON public.misa_customers USING btree (phone);


--
-- Name: idx_misa_customers_sync_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_customers_sync_status ON public.misa_customers USING btree (sync_status);


--
-- Name: idx_misa_invoices_branch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_invoices_branch_id ON public.misa_invoices USING btree (branch_id);


--
-- Name: idx_misa_invoices_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_invoices_customer_id ON public.misa_invoices USING btree (customer_id);


--
-- Name: idx_misa_invoices_invoice_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_invoices_invoice_code ON public.misa_invoices USING btree (invoice_code);


--
-- Name: idx_misa_invoices_invoice_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_invoices_invoice_date ON public.misa_invoices USING btree (invoice_date);


--
-- Name: idx_misa_invoices_invoice_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_invoices_invoice_id ON public.misa_invoices USING btree (invoice_id);


--
-- Name: idx_misa_invoices_last_sync; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_invoices_last_sync ON public.misa_invoices USING btree (last_sync_date);


--
-- Name: idx_misa_invoices_payment_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_invoices_payment_status ON public.misa_invoices USING btree (payment_status);


--
-- Name: idx_misa_invoices_sync_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_invoices_sync_status ON public.misa_invoices USING btree (sync_status);


--
-- Name: idx_misa_items_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_items_active ON public.misa_inventory_items USING btree (is_active);


--
-- Name: idx_misa_items_barcode; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_items_barcode ON public.misa_inventory_items USING btree (barcode);


--
-- Name: idx_misa_items_brand; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_items_brand ON public.misa_inventory_items USING btree (brand_name);


--
-- Name: idx_misa_items_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_items_category ON public.misa_inventory_items USING btree (inventory_item_category_id);


--
-- Name: idx_misa_items_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_items_code ON public.misa_inventory_items USING btree (inventory_item_code);


--
-- Name: idx_misa_items_last_sync; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_items_last_sync ON public.misa_inventory_items USING btree (last_sync_date);


--
-- Name: idx_misa_items_sync_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_items_sync_status ON public.misa_inventory_items USING btree (sync_status);


--
-- Name: idx_misa_sync_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_sync_created_at ON public.misa_sync_logs USING btree (created_at);


--
-- Name: idx_misa_sync_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_sync_status ON public.misa_sync_logs USING btree (status);


--
-- Name: idx_misa_sync_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_sync_type ON public.misa_sync_logs USING btree (sync_type);


--
-- Name: idx_misa_warehouses_branch_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_warehouses_branch_id ON public.misa_warehouses USING btree (branch_id);


--
-- Name: idx_misa_warehouses_is_inactive; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_warehouses_is_inactive ON public.misa_warehouses USING btree (is_inactive);


--
-- Name: idx_misa_warehouses_stock_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_misa_warehouses_stock_code ON public.misa_warehouses USING btree (stock_code);


--
-- Name: idx_one_pending_per_user; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_one_pending_per_user ON public.email_verification_tokens USING btree (user_id) WHERE (verified_at IS NULL);


--
-- Name: idx_order_invoice_forwarded; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_order_invoice_forwarded ON public.orders USING btree (invoice_forwarded);


--
-- Name: idx_order_items_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_order_items_order_id ON public.order_items USING btree (order_id);


--
-- Name: idx_order_misa_item_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_order_misa_item_created ON public.orders USING btree (misa_item_created);


--
-- Name: idx_order_misa_sale_recorded; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_order_misa_sale_recorded ON public.orders USING btree (misa_sale_recorded);


--
-- Name: idx_order_payment_schedule_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_order_payment_schedule_order ON public.order_payment_schedule USING btree (order_id);


--
-- Name: idx_order_payment_schedule_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_order_payment_schedule_status ON public.order_payment_schedule USING btree (status);


--
-- Name: idx_order_status_history_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_order_status_history_order ON public.order_status_history USING btree (order_id);


--
-- Name: idx_orders_payment_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orders_payment_status ON public.orders USING btree (payment_status);


--
-- Name: idx_orders_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orders_status ON public.orders USING btree (status);


--
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- Name: idx_orders_vendor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_orders_vendor_id ON public.orders USING btree (vendor_id);


--
-- Name: idx_otp_cleanup; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_otp_cleanup ON public.user_otps USING btree (created_at, verified_at);


--
-- Name: idx_otp_email_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_otp_email_type ON public.user_otps USING btree (email, type, verified_at);


--
-- Name: idx_otp_user_pending; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_otp_user_pending ON public.user_otps USING btree (user_id, type, verified_at);


--
-- Name: idx_partner_cap_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_partner_cap_type ON public.partner_capabilities USING btree (capability_type);


--
-- Name: idx_partner_cap_vendor; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_partner_cap_vendor ON public.partner_capabilities USING btree (vendor_id);


--
-- Name: idx_partner_inventory_low_stock; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_partner_inventory_low_stock ON public.partner_inventory USING btree (partner_id, quantity_available);


--
-- Name: idx_partner_inventory_partner; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_partner_inventory_partner ON public.partner_inventory USING btree (partner_id);


--
-- Name: idx_partner_inventory_product; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_partner_inventory_product ON public.partner_inventory USING btree (product_id);


--
-- Name: idx_partner_sales_partner_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_partner_sales_partner_date ON public.partner_sales USING btree (partner_id, sold_at);


--
-- Name: idx_partner_sales_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_partner_sales_status ON public.partner_sales USING btree (status);


--
-- Name: idx_payment_transactions_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_payment_transactions_order_id ON public.order_payment_transactions USING btree (order_id);


--
-- Name: idx_payment_transactions_schedule_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_payment_transactions_schedule_id ON public.order_payment_transactions USING btree (schedule_id);


--
-- Name: idx_permission_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_permission_name ON public.permissions USING btree (name);


--
-- Name: idx_permission_resource; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_permission_resource ON public.permissions USING btree (resource);


--
-- Name: idx_pfc_band_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pfc_band_code ON public.product_finder_combinations USING btree (band_code);


--
-- Name: idx_pfc_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pfc_is_active ON public.product_finder_combinations USING btree (is_active);


--
-- Name: idx_pfc_main_stone_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pfc_main_stone_code ON public.product_finder_combinations USING btree (main_stone_code);


--
-- Name: idx_pfs_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pfs_created_at ON public.product_finder_selections USING btree (created_at);


--
-- Name: idx_pfs_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pfs_user_id ON public.product_finder_selections USING btree (user_id);


--
-- Name: idx_po_age_group_allocations_age_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_po_age_group_allocations_age_group_id ON public.purchase_order_age_group_allocations USING btree (age_group_id);


--
-- Name: idx_po_age_group_allocations_po_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_po_age_group_allocations_po_id ON public.purchase_order_age_group_allocations USING btree (purchase_order_id);


--
-- Name: idx_po_item_variants_age_group_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_po_item_variants_age_group_id ON public.purchase_order_item_variants USING btree (age_group_id);


--
-- Name: idx_po_item_variants_material_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_po_item_variants_material_id ON public.purchase_order_item_variants USING btree (material_id);


--
-- Name: idx_po_item_variants_po_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_po_item_variants_po_item_id ON public.purchase_order_item_variants USING btree (purchase_order_item_id);


--
-- Name: idx_pod_commissions_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_commissions_created_at ON public.pod_commissions USING btree (created_at);


--
-- Name: idx_pod_commissions_partner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_commissions_partner_id ON public.pod_commissions USING btree (partner_id);


--
-- Name: idx_pod_commissions_pod_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_commissions_pod_id ON public.pod_commissions USING btree (pod_id);


--
-- Name: idx_pod_commissions_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_commissions_status ON public.pod_commissions USING btree (status);


--
-- Name: idx_pod_partners_business_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_partners_business_name ON public.pod_partners USING btree (business_name);


--
-- Name: idx_pod_partners_is_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_partners_is_deleted ON public.pod_partners USING btree (is_deleted);


--
-- Name: idx_pod_partners_partner_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_partners_partner_type ON public.pod_partners USING btree (partner_type);


--
-- Name: idx_pod_partners_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_partners_status ON public.pod_partners USING btree (status);


--
-- Name: idx_pod_products_assigned_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_products_assigned_date ON public.pod_products USING btree (assigned_date);


--
-- Name: idx_pod_products_pod_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_products_pod_id ON public.pod_products USING btree (pod_id);


--
-- Name: idx_pod_products_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_products_product_id ON public.pod_products USING btree (product_id);


--
-- Name: idx_pod_qr_codes_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pod_qr_codes_type ON public.pod_qr_codes USING btree (qr_code_type);


--
-- Name: idx_pods_is_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pods_is_deleted ON public.pods USING btree (is_deleted);


--
-- Name: idx_pods_location_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pods_location_id ON public.pods USING btree (location_id);


--
-- Name: idx_pods_partner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pods_partner_id ON public.pods USING btree (partner_id);


--
-- Name: idx_pods_pod_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pods_pod_type ON public.pods USING btree (pod_type);


--
-- Name: idx_pods_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pods_status ON public.pods USING btree (status);


--
-- Name: idx_por_collection_plan_item; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_por_collection_plan_item ON public.production_orders USING btree (collection_plan_item_id);


--
-- Name: idx_por_current_holder; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_por_current_holder ON public.production_orders USING btree (current_holder_id);


--
-- Name: idx_por_estimated_completion; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_por_estimated_completion ON public.production_orders USING btree (estimated_completion_date);


--
-- Name: idx_por_jtrc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_por_jtrc ON public.production_orders USING btree (jtrc_id);


--
-- Name: idx_por_needs_spec_review; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_por_needs_spec_review ON public.production_orders USING btree (needs_spec_review);


--
-- Name: idx_por_order_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_por_order_number ON public.production_orders USING btree (order_number);


--
-- Name: idx_por_production_plan; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_por_production_plan ON public.production_orders USING btree (production_plan_id);


--
-- Name: idx_por_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_por_status ON public.production_orders USING btree (status);


--
-- Name: idx_pos_assigned_vendor; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_assigned_vendor ON public.production_order_stages USING btree (assigned_vendor_id);


--
-- Name: idx_pos_capability; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_capability ON public.production_order_stages USING btree (required_capability);


--
-- Name: idx_pos_history_action_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_history_action_type ON public.inventory_position_history USING btree (action_type);


--
-- Name: idx_pos_history_performed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_history_performed_at ON public.inventory_position_history USING btree (performed_at);


--
-- Name: idx_pos_history_performed_by; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_history_performed_by ON public.inventory_position_history USING btree (performed_by);


--
-- Name: idx_pos_history_position_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_history_position_id ON public.inventory_position_history USING btree (position_id);


--
-- Name: idx_pos_history_product_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_history_product_code ON public.inventory_position_history USING btree (product_code);


--
-- Name: idx_pos_history_reference; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_history_reference ON public.inventory_position_history USING btree (reference_type, reference_id);


--
-- Name: idx_pos_history_to_warehouse; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_history_to_warehouse ON public.inventory_position_history USING btree (to_warehouse_id);


--
-- Name: idx_pos_production_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_production_order ON public.production_order_stages USING btree (production_order_id);


--
-- Name: idx_pos_stage_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_stage_order ON public.production_order_stages USING btree (stage_order);


--
-- Name: idx_pos_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_status ON public.production_order_stages USING btree (status);


--
-- Name: idx_pos_workflow_stage; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pos_workflow_stage ON public.production_order_stages USING btree (workflow_stage_id);


--
-- Name: idx_positions_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_positions_is_active ON public.inventory_positions USING btree (is_active);


--
-- Name: idx_positions_product_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_positions_product_code ON public.inventory_positions USING btree (product_code);


--
-- Name: idx_positions_rack_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_positions_rack_id ON public.inventory_positions USING btree (rack_id);


--
-- Name: idx_positions_slot_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_positions_slot_id ON public.inventory_positions USING btree (slot_id);


--
-- Name: idx_positions_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_positions_status ON public.inventory_positions USING btree (position_status);


--
-- Name: idx_positions_warehouse_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_positions_warehouse_id ON public.inventory_positions USING btree (warehouse_id);


--
-- Name: idx_ppl_collection_plan; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ppl_collection_plan ON public.production_plans USING btree (collection_plan_id);


--
-- Name: idx_ppl_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ppl_name ON public.production_plans USING btree (name);


--
-- Name: idx_ppl_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ppl_status ON public.production_plans USING btree (status);


--
-- Name: idx_ppl_target_end; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ppl_target_end ON public.production_plans USING btree (target_end_date);


--
-- Name: idx_ppl_target_start; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ppl_target_start ON public.production_plans USING btree (target_start_date);


--
-- Name: idx_ppl_workflow_template; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ppl_workflow_template ON public.production_plans USING btree (workflow_template_id);


--
-- Name: idx_print_job_items_epc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_print_job_items_epc ON public.print_job_items USING btree (epc);


--
-- Name: idx_print_job_items_job; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_print_job_items_job ON public.print_job_items USING btree (print_job_id);


--
-- Name: idx_print_job_items_product; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_print_job_items_product ON public.print_job_items USING btree (product_id);


--
-- Name: idx_print_job_items_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_print_job_items_status ON public.print_job_items USING btree (status);


--
-- Name: idx_print_jobs_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_print_jobs_created_at ON public.print_jobs USING btree (created_at DESC);


--
-- Name: idx_print_jobs_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_print_jobs_status ON public.print_jobs USING btree (status);


--
-- Name: idx_print_jobs_template; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_print_jobs_template ON public.print_jobs USING btree (template_id);


--
-- Name: idx_product_certificates_certificate_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_product_certificates_certificate_id ON public.product_certificates USING btree (certificate_id);


--
-- Name: idx_product_certificates_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_product_certificates_product_id ON public.product_certificates USING btree (product_id);


--
-- Name: idx_product_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_product_status ON public.mirror_products USING btree (status);


--
-- Name: idx_pua_expires; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pua_expires ON public.pod_user_attributions USING btree (expires_at);


--
-- Name: idx_pua_partner; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pua_partner ON public.pod_user_attributions USING btree (partner_id);


--
-- Name: idx_pua_user_pod; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pua_user_pod ON public.pod_user_attributions USING btree (user_id, pod_id);


--
-- Name: idx_pua_user_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_pua_user_status ON public.pod_user_attributions USING btree (user_id, status);


--
-- Name: idx_purchase_order_items_material_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_purchase_order_items_material_id ON public.purchase_order_items USING btree (material_id);


--
-- Name: idx_purchase_order_items_purchase_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_purchase_order_items_purchase_order_id ON public.purchase_order_items USING btree (purchase_order_id);


--
-- Name: idx_purchase_orders_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_purchase_orders_created_at ON public.purchase_orders USING btree (created_at);


--
-- Name: idx_purchase_orders_expected_delivery_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_purchase_orders_expected_delivery_date ON public.purchase_orders USING btree (expected_delivery_date);


--
-- Name: idx_purchase_orders_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_purchase_orders_status ON public.purchase_orders USING btree (status);


--
-- Name: idx_purchase_orders_vendor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_purchase_orders_vendor_id ON public.purchase_orders USING btree (vendor_id);


--
-- Name: idx_qr_code_pod; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_code_pod ON public.pod_qr_codes USING btree (pod_id);


--
-- Name: idx_qr_code_product; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_code_product ON public.pod_qr_codes USING btree (product_id);


--
-- Name: idx_qr_code_short_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_code_short_code ON public.pod_qr_codes USING btree (short_code);


--
-- Name: idx_qr_code_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_code_status ON public.pod_qr_codes USING btree (status);


--
-- Name: idx_qr_codes_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_codes_code ON public.qr_codes USING btree (code);


--
-- Name: idx_qr_codes_partner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_codes_partner_id ON public.qr_codes USING btree (partner_id);


--
-- Name: idx_qr_codes_pod_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_codes_pod_id ON public.qr_codes USING btree (pod_id);


--
-- Name: idx_qr_codes_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_codes_product_id ON public.qr_codes USING btree (product_id);


--
-- Name: idx_qr_codes_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_codes_status ON public.qr_codes USING btree (status);


--
-- Name: idx_qr_codes_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_codes_type ON public.qr_codes USING btree (qr_code_type);


--
-- Name: idx_qr_scan_partner; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scan_partner ON public.pod_qr_scans USING btree (partner_id);


--
-- Name: idx_qr_scan_partner_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scan_partner_date ON public.pod_qr_scans USING btree (partner_id, scanned_at);


--
-- Name: idx_qr_scan_pod; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scan_pod ON public.pod_qr_scans USING btree (pod_id);


--
-- Name: idx_qr_scan_product; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scan_product ON public.pod_qr_scans USING btree (product_id);


--
-- Name: idx_qr_scan_qr_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scan_qr_code ON public.pod_qr_scans USING btree (qr_code_id);


--
-- Name: idx_qr_scan_scanned_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scan_scanned_at ON public.pod_qr_scans USING btree (scanned_at);


--
-- Name: idx_qr_scan_session; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scan_session ON public.pod_qr_scans USING btree (session_id);


--
-- Name: idx_qr_scan_user; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scan_user ON public.pod_qr_scans USING btree (user_id);


--
-- Name: idx_qr_scans_attribution_expires; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scans_attribution_expires ON public.qr_scans USING btree (attribution_expires_at);


--
-- Name: idx_qr_scans_dedup; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scans_dedup ON public.qr_scans USING btree (qr_code_id, device_fingerprint, scanned_at);


--
-- Name: idx_qr_scans_device_fingerprint; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scans_device_fingerprint ON public.qr_scans USING btree (device_fingerprint);


--
-- Name: idx_qr_scans_qr_code_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scans_qr_code_id ON public.qr_scans USING btree (qr_code_id);


--
-- Name: idx_qr_scans_scanned_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scans_scanned_at ON public.qr_scans USING btree (scanned_at);


--
-- Name: idx_qr_scans_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_qr_scans_session_id ON public.qr_scans USING btree (session_id);


--
-- Name: idx_racks_floor_level; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_racks_floor_level ON public.warehouse_racks USING btree (floor_level);


--
-- Name: idx_racks_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_racks_is_active ON public.warehouse_racks USING btree (is_active);


--
-- Name: idx_racks_rack_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_racks_rack_code ON public.warehouse_racks USING btree (rack_code);


--
-- Name: idx_racks_warehouse_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_racks_warehouse_id ON public.warehouse_racks USING btree (warehouse_id);


--
-- Name: idx_recon_created_by; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_recon_created_by ON public.stock_reconciliation_records USING btree (created_by);


--
-- Name: idx_recon_date; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_recon_date ON public.stock_reconciliation_records USING btree (reconciliation_date);


--
-- Name: idx_recon_document_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_recon_document_number ON public.stock_reconciliation_records USING btree (document_number);


--
-- Name: idx_recon_warehouse_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_recon_warehouse_id ON public.stock_reconciliation_records USING btree (warehouse_id);


--
-- Name: idx_rfid_scan_logs_device; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rfid_scan_logs_device ON public.rfid_scan_logs USING btree (device_id);


--
-- Name: idx_rfid_scan_logs_epc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rfid_scan_logs_epc ON public.rfid_scan_logs USING btree (epc);


--
-- Name: idx_rfid_scan_logs_location; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rfid_scan_logs_location ON public.rfid_scan_logs USING btree (location);


--
-- Name: idx_rfid_scan_logs_product; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rfid_scan_logs_product ON public.rfid_scan_logs USING btree (product_id);


--
-- Name: idx_rfid_scan_logs_scanned_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rfid_scan_logs_scanned_at ON public.rfid_scan_logs USING btree (scanned_at DESC);


--
-- Name: idx_rfid_scan_logs_tag; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rfid_scan_logs_tag ON public.rfid_scan_logs USING btree (tag_id);


--
-- Name: idx_rfid_tags_epc; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX idx_rfid_tags_epc ON public.rfid_tags USING btree (epc);


--
-- Name: idx_rfid_tags_print_job; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rfid_tags_print_job ON public.rfid_tags USING btree (print_job_id);


--
-- Name: idx_rfid_tags_product; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rfid_tags_product ON public.rfid_tags USING btree (product_id);


--
-- Name: idx_rfid_tags_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rfid_tags_status ON public.rfid_tags USING btree (status);


--
-- Name: idx_role_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_role_name ON public.roles USING btree (name);


--
-- Name: idx_s3_files_active_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_s3_files_active_deleted ON public.s3_files USING btree (is_active, is_deleted);


--
-- Name: idx_s3_files_content_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_s3_files_content_type ON public.s3_files USING btree (content_type);


--
-- Name: idx_s3_files_s3_key; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_s3_files_s3_key ON public.s3_files USING btree (s3_key);


--
-- Name: idx_sale_items_sale; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_sale_items_sale ON public.partner_sale_items USING btree (sale_id);


--
-- Name: idx_slots_current_product; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_slots_current_product ON public.warehouse_slots USING btree (current_product_code);


--
-- Name: idx_slots_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_slots_is_active ON public.warehouse_slots USING btree (is_active);


--
-- Name: idx_slots_is_occupied; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_slots_is_occupied ON public.warehouse_slots USING btree (is_occupied);


--
-- Name: idx_slots_rack_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_slots_rack_id ON public.warehouse_slots USING btree (rack_id);


--
-- Name: idx_slots_slot_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_slots_slot_code ON public.warehouse_slots USING btree (slot_code);


--
-- Name: idx_slots_slot_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_slots_slot_type ON public.warehouse_slots USING btree (slot_type);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_email ON public.users USING btree (email);


--
-- Name: idx_user_username; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_user_username ON public.users USING btree (username);


--
-- Name: idx_vendor_products_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_vendor_products_product_id ON public.vendor_products USING btree (product_id);


--
-- Name: idx_vendor_products_vendor_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_vendor_products_vendor_id ON public.vendor_products USING btree (vendor_id);


--
-- Name: idx_vendors_active_deleted; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_vendors_active_deleted ON public.vendors USING btree (is_active, is_deleted);


--
-- Name: idx_vendors_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_vendors_code ON public.vendors USING btree (code);


--
-- Name: idx_vendors_country; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_vendors_country ON public.vendors USING btree (country);


--
-- Name: idx_vendors_owner_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_vendors_owner_user_id ON public.vendors USING btree (owner_user_id);


--
-- Name: idx_vendors_vendor_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_vendors_vendor_type ON public.vendors USING btree (vendor_type);


--
-- Name: idx_verification_cleanup; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_verification_cleanup ON public.email_verification_tokens USING btree (expires_at, verified_at);


--
-- Name: idx_verification_token; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_verification_token ON public.email_verification_tokens USING btree (token);


--
-- Name: idx_verification_user_pending; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_verification_user_pending ON public.email_verification_tokens USING btree (user_id, verified_at);


--
-- Name: idx_wfs_capability; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wfs_capability ON public.workflow_stages USING btree (required_capability);


--
-- Name: idx_wfs_stage_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wfs_stage_order ON public.workflow_stages USING btree (stage_order);


--
-- Name: idx_wfs_template; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wfs_template ON public.workflow_stages USING btree (template_id);


--
-- Name: idx_wft_category; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wft_category ON public.workflow_templates USING btree (category);


--
-- Name: idx_wft_is_default; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wft_is_default ON public.workflow_templates USING btree (is_default);


--
-- Name: idx_wft_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wft_name ON public.workflow_templates USING btree (name);


--
-- Name: idx_wft_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wft_status ON public.workflow_templates USING btree (status);


--
-- Name: idx_wholesale_orders_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wholesale_orders_created ON public.wholesale_orders USING btree (created_at);


--
-- Name: idx_wholesale_orders_partner; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wholesale_orders_partner ON public.wholesale_orders USING btree (partner_id);


--
-- Name: idx_wholesale_orders_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wholesale_orders_status ON public.wholesale_orders USING btree (status);


--
-- Name: idx_wo_items_order; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_wo_items_order ON public.wholesale_order_items USING btree (order_id);


--
-- Name: uk_pua_user_pod_active; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uk_pua_user_pod_active ON public.pod_user_attributions USING btree (user_id, pod_id) WHERE (((status)::text = 'ACTIVE'::text) AND (is_deleted = false));


--
-- Name: age_group_preference_values fk_age_group_preference_values_preference; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.age_group_preference_values
    ADD CONSTRAINT fk_age_group_preference_values_preference FOREIGN KEY (preference_id) REFERENCES public.age_group_preferences(id) ON DELETE CASCADE;


--
-- Name: age_group_preferences fk_age_group_preferences_age_group; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.age_group_preferences
    ADD CONSTRAINT fk_age_group_preferences_age_group FOREIGN KEY (age_group_id) REFERENCES public.age_groups(id) ON DELETE CASCADE;


--
-- Name: appointments fk_appointment_venue; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_appointment_venue FOREIGN KEY (venue_id) REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pod_attributions fk_attribution_commission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_attributions
    ADD CONSTRAINT fk_attribution_commission FOREIGN KEY (commission_id) REFERENCES public.pod_commissions(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pod_attributions fk_attribution_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_attributions
    ADD CONSTRAINT fk_attribution_order FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_attributions fk_attribution_partner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_attributions
    ADD CONSTRAINT fk_attribution_partner FOREIGN KEY (partner_id) REFERENCES public.pod_partners(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_attributions fk_attribution_pod; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_attributions
    ADD CONSTRAINT fk_attribution_pod FOREIGN KEY (pod_id) REFERENCES public.pods(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_attributions fk_attribution_qr_code; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_attributions
    ADD CONSTRAINT fk_attribution_qr_code FOREIGN KEY (qr_code_id) REFERENCES public.pod_qr_codes(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pod_attributions fk_attribution_scan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_attributions
    ADD CONSTRAINT fk_attribution_scan FOREIGN KEY (scan_id) REFERENCES public.pod_qr_scans(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: blocked_slots fk_blocked_slot_venue; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blocked_slots
    ADD CONSTRAINT fk_blocked_slot_venue FOREIGN KEY (venue_id) REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: component_ownership_logs fk_col_from_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.component_ownership_logs
    ADD CONSTRAINT fk_col_from_vendor FOREIGN KEY (from_vendor_id) REFERENCES public.vendors(id) ON DELETE SET NULL;


--
-- Name: component_ownership_logs fk_col_production_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.component_ownership_logs
    ADD CONSTRAINT fk_col_production_order FOREIGN KEY (production_order_id) REFERENCES public.production_orders(id) ON DELETE CASCADE;


--
-- Name: component_ownership_logs fk_col_stage; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.component_ownership_logs
    ADD CONSTRAINT fk_col_stage FOREIGN KEY (stage_id) REFERENCES public.production_order_stages(id) ON DELETE SET NULL;


--
-- Name: component_ownership_logs fk_col_to_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.component_ownership_logs
    ADD CONSTRAINT fk_col_to_vendor FOREIGN KEY (to_vendor_id) REFERENCES public.vendors(id) ON DELETE SET NULL;


--
-- Name: collection_age_group_allocations fk_collection_age_group_allocations_age_group; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_age_group_allocations
    ADD CONSTRAINT fk_collection_age_group_allocations_age_group FOREIGN KEY (age_group_id) REFERENCES public.age_groups(id) ON DELETE RESTRICT;


--
-- Name: collection_age_group_allocations fk_collection_age_group_allocations_collection_plan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_age_group_allocations
    ADD CONSTRAINT fk_collection_age_group_allocations_collection_plan FOREIGN KEY (collection_plan_id) REFERENCES public.collection_plans(id) ON DELETE CASCADE;


--
-- Name: collection_plan_items fk_collection_plan_items_collection_plan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_plan_items
    ADD CONSTRAINT fk_collection_plan_items_collection_plan FOREIGN KEY (collection_plan_id) REFERENCES public.collection_plans(id) ON DELETE CASCADE;


--
-- Name: collection_products fk_collection_products_collection; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_products
    ADD CONSTRAINT fk_collection_products_collection FOREIGN KEY (collection_id) REFERENCES public.collections(id);


--
-- Name: collection_products fk_collection_products_mirror_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.collection_products
    ADD CONSTRAINT fk_collection_products_mirror_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON DELETE CASCADE;


--
-- Name: component_optionals fk_component_optional_component; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.component_optionals
    ADD CONSTRAINT fk_component_optional_component FOREIGN KEY (component_id) REFERENCES public.components(id);


--
-- Name: components fk_component_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT fk_component_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id);


--
-- Name: design_products fk_design_products_designer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.design_products
    ADD CONSTRAINT fk_design_products_designer FOREIGN KEY (designer_id) REFERENCES public.designers(id) ON DELETE CASCADE;


--
-- Name: design_products fk_design_products_mirror_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.design_products
    ADD CONSTRAINT fk_design_products_mirror_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON DELETE CASCADE;


--
-- Name: design_sale_transactions fk_design_sale_transactions_design_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.design_sale_transactions
    ADD CONSTRAINT fk_design_sale_transactions_design_product FOREIGN KEY (design_product_id) REFERENCES public.design_products(id) ON DELETE CASCADE;


--
-- Name: inventory_movements fk_inv_movement_inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_movements
    ADD CONSTRAINT fk_inv_movement_inventory FOREIGN KEY (inventory_id) REFERENCES public.partner_inventory(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: inventory_movements fk_inv_movement_partner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_movements
    ADD CONSTRAINT fk_inv_movement_partner FOREIGN KEY (partner_id) REFERENCES public.pod_partners(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: item_variant_configs fk_item_variant_config_component_optional; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_variant_configs
    ADD CONSTRAINT fk_item_variant_config_component_optional FOREIGN KEY (component_optional_id) REFERENCES public.component_optionals(id);


--
-- Name: item_variant_configs fk_item_variant_config_item_variant; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.item_variant_configs
    ADD CONSTRAINT fk_item_variant_config_item_variant FOREIGN KEY (item_variant_id) REFERENCES public.item_variants(id);


--
-- Name: jtrc_labor_components fk_jtrc_labor_jtrc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jtrc_labor_components
    ADD CONSTRAINT fk_jtrc_labor_jtrc FOREIGN KEY (jtrc_id) REFERENCES public.jewelry_technical_reports(id) ON DELETE CASCADE;


--
-- Name: jtrc_metal_components fk_jtrc_metal_jtrc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jtrc_metal_components
    ADD CONSTRAINT fk_jtrc_metal_jtrc FOREIGN KEY (jtrc_id) REFERENCES public.jewelry_technical_reports(id) ON DELETE CASCADE;


--
-- Name: jtrc_stone_components fk_jtrc_stone_jtrc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jtrc_stone_components
    ADD CONSTRAINT fk_jtrc_stone_jtrc FOREIGN KEY (jtrc_id) REFERENCES public.jewelry_technical_reports(id) ON DELETE CASCADE;


--
-- Name: mirror_diamonds fk_lab_grown_diamonds_mirror_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mirror_diamonds
    ADD CONSTRAINT fk_lab_grown_diamonds_mirror_product FOREIGN KEY (mirror_product_id) REFERENCES public.mirror_products(id) ON DELETE SET NULL;


--
-- Name: material_inventory fk_material_inventory_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.material_inventory
    ADD CONSTRAINT fk_material_inventory_vendor FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE RESTRICT;


--
-- Name: mirror_products fk_mirror_misa_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mirror_products
    ADD CONSTRAINT fk_mirror_misa_item FOREIGN KEY (misa_item_code) REFERENCES public.misa_inventory_items(inventory_item_code) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: misa_product_categories fk_misa_cat_parent; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_product_categories
    ADD CONSTRAINT fk_misa_cat_parent FOREIGN KEY (parent_id) REFERENCES public.misa_product_categories(category_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: misa_invoices fk_misa_invoice_customer; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.misa_invoices
    ADD CONSTRAINT fk_misa_invoice_customer FOREIGN KEY (customer_id) REFERENCES public.misa_customers(customer_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_items fk_order_items_mirror_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_mirror_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON DELETE SET NULL;


--
-- Name: order_items fk_order_items_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_payment_schedule fk_order_payment_schedule_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payment_schedule
    ADD CONSTRAINT fk_order_payment_schedule_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_status_history fk_order_status_history_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_status_history
    ADD CONSTRAINT fk_order_status_history_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: orders fk_orders_mirror_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_mirror_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON DELETE CASCADE;


--
-- Name: orders fk_orders_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_vendor FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE SET NULL;


--
-- Name: partner_capabilities fk_partner_cap_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_capabilities
    ADD CONSTRAINT fk_partner_cap_vendor FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: partner_inventory fk_partner_inventory_partner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_inventory
    ADD CONSTRAINT fk_partner_inventory_partner FOREIGN KEY (partner_id) REFERENCES public.pod_partners(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: partner_inventory fk_partner_inventory_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_inventory
    ADD CONSTRAINT fk_partner_inventory_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: partner_sales fk_partner_sale_partner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_sales
    ADD CONSTRAINT fk_partner_sale_partner FOREIGN KEY (partner_id) REFERENCES public.pod_partners(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: partner_sales fk_partner_sale_pod; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_sales
    ADD CONSTRAINT fk_partner_sale_pod FOREIGN KEY (pod_id) REFERENCES public.pods(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: partner_sales fk_partner_sale_qr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_sales
    ADD CONSTRAINT fk_partner_sale_qr FOREIGN KEY (qr_code_id) REFERENCES public.pod_qr_codes(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: order_payment_transactions fk_payment_transaction_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payment_transactions
    ADD CONSTRAINT fk_payment_transaction_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: order_payment_transactions fk_payment_transaction_schedule; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payment_transactions
    ADD CONSTRAINT fk_payment_transaction_schedule FOREIGN KEY (schedule_id) REFERENCES public.order_payment_schedule(id);


--
-- Name: purchase_order_age_group_allocations fk_po_age_group_allocations_age_group; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_age_group_allocations
    ADD CONSTRAINT fk_po_age_group_allocations_age_group FOREIGN KEY (age_group_id) REFERENCES public.age_groups(id) ON DELETE RESTRICT;


--
-- Name: purchase_order_age_group_allocations fk_po_age_group_allocations_purchase_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_age_group_allocations
    ADD CONSTRAINT fk_po_age_group_allocations_purchase_order FOREIGN KEY (purchase_order_id) REFERENCES public.purchase_orders(id) ON DELETE CASCADE;


--
-- Name: purchase_order_item_variants fk_po_item_variants_age_group; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_item_variants
    ADD CONSTRAINT fk_po_item_variants_age_group FOREIGN KEY (age_group_id) REFERENCES public.age_groups(id) ON DELETE RESTRICT;


--
-- Name: purchase_order_item_variants fk_po_item_variants_material; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_item_variants
    ADD CONSTRAINT fk_po_item_variants_material FOREIGN KEY (material_id) REFERENCES public.material_inventory(id) ON DELETE RESTRICT;


--
-- Name: purchase_order_item_variants fk_po_item_variants_po_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_item_variants
    ADD CONSTRAINT fk_po_item_variants_po_item FOREIGN KEY (purchase_order_item_id) REFERENCES public.purchase_order_items(id) ON DELETE CASCADE;


--
-- Name: pod_commissions fk_pod_commissions_partner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_commissions
    ADD CONSTRAINT fk_pod_commissions_partner FOREIGN KEY (partner_id) REFERENCES public.pod_partners(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pod_commissions fk_pod_commissions_pod; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_commissions
    ADD CONSTRAINT fk_pod_commissions_pod FOREIGN KEY (pod_id) REFERENCES public.pods(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pod_commissions fk_pod_commissions_scan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_commissions
    ADD CONSTRAINT fk_pod_commissions_scan FOREIGN KEY (attributed_scan_id) REFERENCES public.qr_scans(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pod_products fk_pod_products_pod; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_products
    ADD CONSTRAINT fk_pod_products_pod FOREIGN KEY (pod_id) REFERENCES public.pods(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_products fk_pod_products_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_products
    ADD CONSTRAINT fk_pod_products_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pods fk_pods_location; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pods
    ADD CONSTRAINT fk_pods_location FOREIGN KEY (location_id) REFERENCES public.locations(id) ON DELETE SET NULL;


--
-- Name: pods fk_pods_partner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pods
    ADD CONSTRAINT fk_pods_partner FOREIGN KEY (partner_id) REFERENCES public.pod_partners(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: production_orders fk_por_collection_plan_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT fk_por_collection_plan_item FOREIGN KEY (collection_plan_item_id) REFERENCES public.collection_plan_items(id) ON DELETE SET NULL;


--
-- Name: production_orders fk_por_jtrc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT fk_por_jtrc FOREIGN KEY (jtrc_id) REFERENCES public.jewelry_technical_reports(id) ON DELETE SET NULL;


--
-- Name: production_orders fk_por_production_plan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_orders
    ADD CONSTRAINT fk_por_production_plan FOREIGN KEY (production_plan_id) REFERENCES public.production_plans(id) ON DELETE RESTRICT;


--
-- Name: production_order_stages fk_pos_assigned_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_order_stages
    ADD CONSTRAINT fk_pos_assigned_vendor FOREIGN KEY (assigned_vendor_id) REFERENCES public.vendors(id) ON DELETE SET NULL;


--
-- Name: production_order_stages fk_pos_production_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_order_stages
    ADD CONSTRAINT fk_pos_production_order FOREIGN KEY (production_order_id) REFERENCES public.production_orders(id) ON DELETE CASCADE;


--
-- Name: production_order_stages fk_pos_workflow_stage; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_order_stages
    ADD CONSTRAINT fk_pos_workflow_stage FOREIGN KEY (workflow_stage_id) REFERENCES public.workflow_stages(id) ON DELETE RESTRICT;


--
-- Name: inventory_position_history fk_position_history_position; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_position_history
    ADD CONSTRAINT fk_position_history_position FOREIGN KEY (position_id) REFERENCES public.inventory_positions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: inventory_positions fk_positions_rack; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_positions
    ADD CONSTRAINT fk_positions_rack FOREIGN KEY (rack_id) REFERENCES public.warehouse_racks(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: inventory_positions fk_positions_slot; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_positions
    ADD CONSTRAINT fk_positions_slot FOREIGN KEY (slot_id) REFERENCES public.warehouse_slots(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: inventory_positions fk_positions_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.inventory_positions
    ADD CONSTRAINT fk_positions_warehouse FOREIGN KEY (warehouse_id) REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: production_plans fk_ppl_collection_plan; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_plans
    ADD CONSTRAINT fk_ppl_collection_plan FOREIGN KEY (collection_plan_id) REFERENCES public.collection_plans(id) ON DELETE SET NULL;


--
-- Name: production_plans fk_ppl_workflow_template; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.production_plans
    ADD CONSTRAINT fk_ppl_workflow_template FOREIGN KEY (workflow_template_id) REFERENCES public.workflow_templates(id) ON DELETE RESTRICT;


--
-- Name: print_job_items fk_print_job_items_job; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_job_items
    ADD CONSTRAINT fk_print_job_items_job FOREIGN KEY (print_job_id) REFERENCES public.print_jobs(id);


--
-- Name: print_job_items fk_print_job_items_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_job_items
    ADD CONSTRAINT fk_print_job_items_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id);


--
-- Name: print_jobs fk_print_jobs_template; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.print_jobs
    ADD CONSTRAINT fk_print_jobs_template FOREIGN KEY (template_id) REFERENCES public.label_templates(id);


--
-- Name: product_certificates fk_product_certificates_certificate; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_certificates
    ADD CONSTRAINT fk_product_certificates_certificate FOREIGN KEY (certificate_id) REFERENCES public.certificates(id) ON DELETE CASCADE;


--
-- Name: product_certificates fk_product_certificates_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_certificates
    ADD CONSTRAINT fk_product_certificates_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON DELETE CASCADE;


--
-- Name: pod_user_attributions fk_pua_partner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_user_attributions
    ADD CONSTRAINT fk_pua_partner FOREIGN KEY (partner_id) REFERENCES public.pod_partners(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_user_attributions fk_pua_pod; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_user_attributions
    ADD CONSTRAINT fk_pua_pod FOREIGN KEY (pod_id) REFERENCES public.pods(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_user_attributions fk_pua_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_user_attributions
    ADD CONSTRAINT fk_pua_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: purchase_order_items fk_purchase_order_items_material; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT fk_purchase_order_items_material FOREIGN KEY (material_id) REFERENCES public.material_inventory(id) ON DELETE RESTRICT;


--
-- Name: purchase_order_items fk_purchase_order_items_purchase_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_order_items
    ADD CONSTRAINT fk_purchase_order_items_purchase_order FOREIGN KEY (purchase_order_id) REFERENCES public.purchase_orders(id) ON DELETE CASCADE;


--
-- Name: purchase_orders fk_purchase_orders_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT fk_purchase_orders_vendor FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE RESTRICT;


--
-- Name: pod_qr_codes fk_qr_code_pod; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_qr_codes
    ADD CONSTRAINT fk_qr_code_pod FOREIGN KEY (pod_id) REFERENCES public.pods(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_qr_codes fk_qr_code_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_qr_codes
    ADD CONSTRAINT fk_qr_code_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: qr_codes fk_qr_codes_partner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qr_codes
    ADD CONSTRAINT fk_qr_codes_partner FOREIGN KEY (partner_id) REFERENCES public.pod_partners(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: qr_codes fk_qr_codes_pod; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qr_codes
    ADD CONSTRAINT fk_qr_codes_pod FOREIGN KEY (pod_id) REFERENCES public.pods(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: qr_codes fk_qr_codes_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qr_codes
    ADD CONSTRAINT fk_qr_codes_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pod_qr_scans fk_qr_scan_partner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_qr_scans
    ADD CONSTRAINT fk_qr_scan_partner FOREIGN KEY (partner_id) REFERENCES public.pod_partners(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_qr_scans fk_qr_scan_pod; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_qr_scans
    ADD CONSTRAINT fk_qr_scan_pod FOREIGN KEY (pod_id) REFERENCES public.pods(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_qr_scans fk_qr_scan_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_qr_scans
    ADD CONSTRAINT fk_qr_scan_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_qr_scans fk_qr_scan_qr_code; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_qr_scans
    ADD CONSTRAINT fk_qr_scan_qr_code FOREIGN KEY (qr_code_id) REFERENCES public.pod_qr_codes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pod_qr_scans fk_qr_scan_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pod_qr_scans
    ADD CONSTRAINT fk_qr_scan_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: qr_scans fk_qr_scans_qr_code; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.qr_scans
    ADD CONSTRAINT fk_qr_scans_qr_code FOREIGN KEY (qr_code_id) REFERENCES public.qr_codes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: warehouse_racks fk_racks_warehouse; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse_racks
    ADD CONSTRAINT fk_racks_warehouse FOREIGN KEY (warehouse_id) REFERENCES public.locations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: rfid_scan_logs fk_rfid_scan_logs_tag; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rfid_scan_logs
    ADD CONSTRAINT fk_rfid_scan_logs_tag FOREIGN KEY (tag_id) REFERENCES public.rfid_tags(id);


--
-- Name: rfid_tags fk_rfid_tags_print_job; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rfid_tags
    ADD CONSTRAINT fk_rfid_tags_print_job FOREIGN KEY (print_job_id) REFERENCES public.print_jobs(id);


--
-- Name: rfid_tags fk_rfid_tags_print_job_item; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rfid_tags
    ADD CONSTRAINT fk_rfid_tags_print_job_item FOREIGN KEY (print_job_item_id) REFERENCES public.print_job_items(id);


--
-- Name: rfid_tags fk_rfid_tags_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rfid_tags
    ADD CONSTRAINT fk_rfid_tags_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id);


--
-- Name: role_permissions fk_role_permissions_permission; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT fk_role_permissions_permission FOREIGN KEY (permission_id) REFERENCES public.permissions(id);


--
-- Name: role_permissions fk_role_permissions_role; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT fk_role_permissions_role FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: partner_sale_items fk_sale_item_inventory; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_sale_items
    ADD CONSTRAINT fk_sale_item_inventory FOREIGN KEY (inventory_id) REFERENCES public.partner_inventory(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: partner_sale_items fk_sale_item_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_sale_items
    ADD CONSTRAINT fk_sale_item_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: partner_sale_items fk_sale_item_sale; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partner_sale_items
    ADD CONSTRAINT fk_sale_item_sale FOREIGN KEY (sale_id) REFERENCES public.partner_sales(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: warehouse_slots fk_slots_rack; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.warehouse_slots
    ADD CONSTRAINT fk_slots_rack FOREIGN KEY (rack_id) REFERENCES public.warehouse_racks(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: user_otps fk_user_otp_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_otps
    ADD CONSTRAINT fk_user_otp_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_roles fk_user_roles_role; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user_roles_role FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- Name: user_roles fk_user_roles_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_user_roles_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: vendor_products fk_vendor_products_mirror_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_products
    ADD CONSTRAINT fk_vendor_products_mirror_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON DELETE CASCADE;


--
-- Name: vendor_products fk_vendor_products_vendor; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vendor_products
    ADD CONSTRAINT fk_vendor_products_vendor FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON DELETE CASCADE;


--
-- Name: email_verification_tokens fk_verification_token_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_verification_tokens
    ADD CONSTRAINT fk_verification_token_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: workflow_stages fk_wfs_template; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workflow_stages
    ADD CONSTRAINT fk_wfs_template FOREIGN KEY (template_id) REFERENCES public.workflow_templates(id) ON DELETE CASCADE;


--
-- Name: wholesale_orders fk_wholesale_order_partner; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wholesale_orders
    ADD CONSTRAINT fk_wholesale_order_partner FOREIGN KEY (partner_id) REFERENCES public.pod_partners(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: wholesale_order_items fk_wo_item_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wholesale_order_items
    ADD CONSTRAINT fk_wo_item_order FOREIGN KEY (order_id) REFERENCES public.wholesale_orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: wholesale_order_items fk_wo_item_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wholesale_order_items
    ADD CONSTRAINT fk_wo_item_product FOREIGN KEY (product_id) REFERENCES public.mirror_products(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

