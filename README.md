# Food Delivery App

📱 Food Delivery App
Key Features:
1. **Interactive Food Menu**:
 - Browse a variety of delicious food items from different categories.
 - Add your favorite items to the cart with a single tap.
 
2. **Dynamic Cart Management**:
 - View and manage your cart in real-time.
 - Increase/decrease item quantities directly from the cart.
 - Drag and drop items to remove them easily.

3. **Customizable UI**:
 - Implemented Bloc pattern to manage state efficiently.
 - Real-time UI updates using StreamBuilder & BehaviorSubject from RxDart.
 - Dynamic color changes to enhance user experience during interactions.

Technical Highlights:
- **Flutter**: Leveraged Flutter's powerful UI toolkit to create a responsive & visually appealing interface.
- **Bloc Pattern**: Used Bloc for state management to ensure clean & maintainable code.
- **RxDart**: Integrated RxDart for handling reactive programming, making the app more efficient.
- **StreamBuilder**: Utilized StreamBuilder to reactively update the UI based on data changes.

Components Breakdown:
- **Home Screen**: Displays categories and a list of food items.
- **ItemContainer**: Each food item is displayed with an image, name, and price. Tap to add to cart.
- **Cart Screen**: Shows all items in the cart with options to modify quantities or remove items.
- **CustomAppBar**: Includes a dynamic cart icon that updates the item count in real-time.



























