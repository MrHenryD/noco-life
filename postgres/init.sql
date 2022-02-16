\connect nocodb;

CREATE EXTENSION moddatetime;

CREATE TABLE public.product (
    id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER product_updated_on
    BEFORE UPDATE ON public.product
    FOR EACH ROW
    EXECUTE PROCEDURE moddatetime (updated_on);

CREATE TABLE public.order (
    id serial PRIMARY KEY,
    product_id INT NOT NULL,
    name VARCHAR (50) NOT NULL,
    address VARCHAR (50) NOT NULL,
    city VARCHAR (50) NOT NULL,
    created_on TIMESTAMP NOT NULL,
    updated_on TIMESTAMP NOT NULL,
    FOREIGN KEY (product_id) REFERENCES public.product (id)
);

CREATE TRIGGER order_updated_on
    BEFORE UPDATE ON public.order
    FOR EACH ROW
    EXECUTE PROCEDURE moddatetime (updated_on);