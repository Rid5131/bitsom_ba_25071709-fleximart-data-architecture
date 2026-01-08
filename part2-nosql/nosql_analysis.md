Section A: RDBMS Limitations

Relational databases struggle with dynamic product attributes because each new attribute requires schema changes. Products like electronics and apparel require different fields, leading to sparse tables or excessive joins. Nested data such as reviews require additional tables, increasing complexity.


Section B: MongoDB Benefits

MongoDB supports flexible schemas, allowing each product to store only relevant attributes. Reviews can be embedded as arrays, enabling faster reads. Horizontal scalability makes MongoDB ideal for rapidly growing catalogs.


Section C: Trade-offs

MongoDB lacks strong relational constraints and joins, making complex transactions harder. It also consumes more storage due to data duplication.