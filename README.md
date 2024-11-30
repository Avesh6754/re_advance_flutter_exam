

---

# 🛒 Flutter E-Commerce App with API Integration

## 📖 Overview  
This is a Flutter-based **E-Commerce App** that uses an **E-Commerce API** for fetching product data. The app incorporates modern state management techniques with **Provider** and handles API calls using the **http package**. Key features include:  
- 🚀 **Splash Screen** for a smooth entry.  
- 🏠 **Home Page** showcasing products fetched dynamically.  
- 📄 **Product Details Page** providing in-depth information about each product.  
- 🛍️ **Cart Page** with **Shared Preferences** for persistent cart data.

---

## 🛠️ Key Features  

1. **Splash Screen**  
   - Displays a loading animation while initializing the app.  
   - Example:  
     ```dart
     class SplashScreen extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
         Future.delayed(Duration(seconds: 3), () {
           Navigator.pushReplacementNamed(context, '/home');
         });
         return Scaffold(
           body: Center(
             child: CircularProgressIndicator(),
           ),
         );
       }
     }
     ```

2. **State Management with Provider**  
   - The app uses **Provider** for managing the state of products and the cart.  
   - Example Provider setup for products:  
     ```dart
     class ProductProvider with ChangeNotifier {
       List<Product> _products = [];

       List<Product> get products => _products;

       Future<void> fetchProducts() async {
         final response = await http.get(Uri.parse('https://api.example.com/products'));
         if (response.statusCode == 200) {
           _products = parseProducts(response.body); // Custom JSON parser
           notifyListeners();
         }
       }
     }
     ```

3. **Home Page with API Integration**  
   - Displays a list of products using `FutureBuilder`.  
   - Example:  
     ```dart
     class HomePage extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
         final productProvider = Provider.of<ProductProvider>(context);

         return Scaffold(
           appBar: AppBar(title: Text('E-Commerce')),
           body: FutureBuilder(
             future: productProvider.fetchProducts(),
             builder: (context, snapshot) {
               if (snapshot.connectionState == ConnectionState.waiting) {
                 return Center(child: CircularProgressIndicator());
               }
               return ListView.builder(
                 itemCount: productProvider.products.length,
                 itemBuilder: (ctx, index) {
                   final product = productProvider.products[index];
                   return ListTile(
                     title: Text(product.name),
                     subtitle: Text('\$${product.price}'),
                     onTap: () {
                       Navigator.pushNamed(context, '/details', arguments: product);
                     },
                   );
                 },
               );
             },
           ),
         );
       }
     }
     ```

4. **Cart Page with Shared Preferences**  
   - Manages cart data persistently using **SharedPreferences**.  
   - Example:  
     ```dart
     class CartProvider with ChangeNotifier {
       List<CartItem> _cartItems = [];

       Future<void> loadCart() async {
         final prefs = await SharedPreferences.getInstance();
         final cartData = prefs.getString('cart') ?? '[]';
         _cartItems = parseCartItems(cartData); // Custom JSON parser
         notifyListeners();
       }

       Future<void> addToCart(CartItem item) async {
         _cartItems.add(item);
         final prefs = await SharedPreferences.getInstance();
         prefs.setString('cart', jsonEncode(_cartItems));
         notifyListeners();
       }
     }
     ```

---

## 🧰 Tools & Packages  
- **Flutter**: Framework  
- **http**: For API calls  
- **Provider**: State management  
- **Shared Preferences**: Data persistence  
- **Dart**: Programming language  

---

## 🌟 How It Works  

1. The **Splash Screen** initializes the app.  
2. **Home Page** fetches products from the API and displays them.  
3. Tapping a product navigates to the **Details Page**, showing product info.  
4. Products can be added to the **Cart**, which uses **SharedPreferences** to save the data locally.  

---

### 🚀 Getting Started  

1. Clone the repository:  
   ```bash
   git clone https://github.com/username/flutter-ecommerce-app.git
   ```  
2. Install dependencies:  
   ```bash
   flutter pub get
   ```  
3. Run the app:  
   ```bash
   flutter run
   ```  

---

## 🔗 GitHub Repository  
[🌐 GitHub - Flutter E-Commerce App](#)

--- 

Would you like further assistance in setting up the repository or refining this description? 😊

<p>
  

  <img src="https://github.com/user-attachments/assets/c6ca2d99-bc70-45a2-9062-15581da141c5" width="22%" Height="35%">
 <img src="https://github.com/user-attachments/assets/cd9f51a2-4591-449b-83c7-7380a2a45d3e" width="22%" Height="35%">
  <img src="https://github.com/user-attachments/assets/711b6233-6bd7-4963-b386-c5678fdd8a81" width="22%" Height="35%">
   <img src="https://github.com/user-attachments/assets/e01e54e4-7c5b-4243-8b08-5a28bff44baf" width="22%" Height="35%">
</p>



https://github.com/user-attachments/assets/2dd39bf9-bb57-49c6-a0b5-4797c88b1e92

