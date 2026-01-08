use fleximart;

db.products.insertMany(require('/Users/riddhichawla/Desktop/Assignment/part2-nosql/products_catalog.json'));

// Electronics under 50000
db.products.find(
  { category: "Electronics", price: { $lt: 50000 } },
  { name: 1, price: 1, stock: 1, _id: 0 }
);

// Avg rating >= 4
db.products.aggregate([
  { $unwind: "$reviews" },
  { $group: { _id: "$name", avgRating: { $avg: "$reviews.rating" } } },
  { $match: { avgRating: { $gte: 4 } } }
]);

// Add review
db.products.updateOne(
  { product_id: "ELEC001" },
  { $push: { reviews: { user: "U999", rating: 4, comment: "Good value", date: new Date() } } }
);

// Avg price by category
db.products.aggregate([
  { $group: { _id: "$category", avg_price: { $avg: "$price" }, product_count: { $sum: 1 } } },
  { $sort: { avg_price: -1 } }
]);
