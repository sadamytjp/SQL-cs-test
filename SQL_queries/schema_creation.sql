CREATE TABLE "orders" (
    "order_id" VARCHAR(500)   NOT NULL,
    "lat" DEC,
    "lng" DEC,
    "dow" INT,
    "promised_time" TIME,
    "actual_time" TIME,
    "on_demand" BOOL,
    "picker_id" VARCHAR(500) NOT NULL,
    "driver_id" VARCHAR(500) NOT NULL,
    "store_branch_id" VARCHAR(500) NOT NULL,
    "total_minutes" DEC,
    CONSTRAINT "pk_orders" PRIMARY KEY (
        "order_id"
     )
);

CREATE TABLE "order_product" (
    "order_id" VARCHAR(500) NOT NULL,
    "product_id" VARCHAR(500) NOT NULL,
    "quantity" DEC,
    "quantity_found" DEC,
    "buy_unit" VARCHAR(500),
    CONSTRAINT "pk_order_product" PRIMARY KEY (
        "product_id"
     )
);

CREATE TABLE "shoppers" (
    "shopper_id" VARCHAR(500)   NOT NULL,
    "seniority" VARCHAR(500),
    "found_rate" FLOAT,
    "picking_speed" DEC,
    "accepted_rate" FLOAT,
    "rating" DEC,
    CONSTRAINT "pk_shoppers" PRIMARY KEY (
        "shopper_id"
     )
);

CREATE TABLE "storebranch" (
    "store_branch_id" VARCHAR(100)   NOT NULL,
    "store" VARCHAR(100),
    "lat" DEC,
    "lng" DEC,
    CONSTRAINT "pk_storebranch" PRIMARY KEY (
        "store_branch_id"
     )
);

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_picker_id" FOREIGN KEY("picker_id")
REFERENCES "shoppers" ("shopper_id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_driver_id" FOREIGN KEY("driver_id")
REFERENCES "shoppers" ("shopper_id");

ALTER TABLE "orders" ADD CONSTRAINT "fk_orders_store_branch_id" FOREIGN KEY("store_branch_id")
REFERENCES "storebranch" ("store_branch_id");

ALTER TABLE "order_product" ADD CONSTRAINT "fk_order_product_order_id" FOREIGN KEY("order_id")
REFERENCES "orders" ("order_id");

