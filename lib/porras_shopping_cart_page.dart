import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Shared style constants
// ---------------------------------------------------------------------------
const Color kBlue = Color(0xFF2563EB);
const Color kLightBlue = Color(0xFFDCE8FD);
const Color kPageBg = Color(0xFFF1F3F6);
const Color kTextDark = Color(0xFF111827);
const Color kTextGrey = Color(0xFF6B7280);
const Color kBorder = Color(0xFFE5E7EB);
const double kRadius = 14;

// ---------------------------------------------------------------------------
// Shopping Cart Page
// ---------------------------------------------------------------------------
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  static const String studentName = 'Jeremy Porras';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBg,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIntroSection(),
            const SizedBox(height: 16),
            _buildDeliveryCard(),
            const SizedBox(height: 20),
            _buildOrderItemsHeader(),
            const SizedBox(height: 10),
            const CartItemCard(
              name: 'Wireless Mouse',
              price: 'PHP 450.00',
              quantity: 1,
              icon: Icons.mouse_outlined,
            ),
            const SizedBox(height: 10),
            const CartItemCard(
              name: 'USB-C Hub',
              price: 'PHP 850.00',
              quantity: 1,
              icon: Icons.usb,
            ),
            const SizedBox(height: 10),
            const CartItemCard(
              name: 'Laptop Stand',
              price: 'PHP 700.00',
              quantity: 1,
              icon: Icons.laptop_mac,
            ),
            const SizedBox(height: 14),
            _buildDiscountBanner(),
            const SizedBox(height: 14),
            _buildPaymentSummary(),
            const SizedBox(height: 14),
            _buildPlaceOrderButton(),
          ],
        ),
      ),
    );
  }

  // ----------------------------- 1. AppBar ---------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: kTextDark),
        onPressed: () => debugPrint('Back clicked'),
      ),
      title: const Text(
        'My Cart',
        style: TextStyle(
          color: kTextDark,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined,
                    color: kTextDark, size: 28),
                onPressed: () => debugPrint('Cart clicked'),
              ),
              Positioned(
                right: 4,
                top: 4,
                child: Container(
                  width: 18,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kBlue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ------------------------ 2. Introduction Section ------------------------
  Widget _buildIntroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: kLightBlue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'CAMPUS STORE',
            style: TextStyle(
              color: kBlue,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.8,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ready for checkout',
          style: TextStyle(
            color: kTextDark,
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Review your items before placing your order.',
          style: TextStyle(color: kTextGrey, fontSize: 13),
        ),
      ],
    );
  }

  // ------------------------ 3. Delivery Information ------------------------
  Widget _buildDeliveryCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: kBlue, size: 28),
          const SizedBox(width: 10),
          Container(width: 1, height: 36, color: kBorder),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to $studentName',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kTextDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Matina, Davao City',
                  style: TextStyle(color: kTextGrey, fontSize: 12),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => debugPrint('Change delivery address clicked'),
            child: const Text(
              'Change',
              style: TextStyle(color: kBlue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // --------------------------- 4. Order Items ------------------------------
  Widget _buildOrderItemsHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Order Items',
          style: TextStyle(
            color: kTextDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '3 items',
          style: TextStyle(color: kTextGrey, fontSize: 13),
        ),
      ],
    );
  }

  // -------------------------- 5. Discount Banner ---------------------------
  Widget _buildDiscountBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Row(
        children: [
          const Icon(Icons.sell_outlined, color: kBlue, size: 24),
          const SizedBox(width: 10),
          Container(width: 1, height: 34, color: kBlue.withValues(alpha: 0.3)),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    color: kTextDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '10% discount on items',
                  style: TextStyle(color: kTextGrey, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: kBlue, size: 28),
        ],
      ),
    );
  }

  // ------------------------- 6. Payment Summary ----------------------------
  Widget _buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Summary',
            style: TextStyle(
              color: kTextDark,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
          SizedBox(height: 6),
          SummaryRow(label: 'Discount (10%)', amount: '\u2212 PHP 200.00'),
          SizedBox(height: 6),
          SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(height: 1, thickness: 1, color: kBorder),
          ),
          SummaryRow(
            label: 'Total',
            amount: 'PHP 1,850.00',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  // ------------------------ 7. Place Order Button --------------------------
  Widget _buildPlaceOrderButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () => debugPrint('Place order clicked! Total: PHP 1850.00'),
        icon: const Icon(Icons.lock, color: Colors.white, size: 20),
        label: const Text(
          'Place Order',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: kBlue,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadius),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Reusable: white rounded card decoration
// ---------------------------------------------------------------------------
BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(kRadius),
    border: Border.all(color: kBorder),
  );
}

// ---------------------------------------------------------------------------
// Reusable: CartItemCard
// ---------------------------------------------------------------------------
class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: _cardDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product icon in a light-blue rounded container
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: kBlue, size: 38),
          ),
          const SizedBox(width: 12),
          // Name, price and quantity controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: kTextDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  price,
                  style: const TextStyle(
                    color: kBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _QuantityButton(
                      icon: Icons.remove,
                      onTap: () => debugPrint('Decrease quantity: $name'),
                    ),
                    Container(
                      width: 38,
                      height: 30,
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kBorder),
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          color: kTextDark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    _QuantityButton(
                      icon: Icons.add,
                      onTap: () => debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Delete button
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            icon: const Icon(Icons.delete_outline, color: kTextGrey),
            onPressed: () => debugPrint('Remove item: $name'),
          ),
        ],
      ),
    );
  }
}

// Small outlined square button used for minus / plus
class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kBlue, width: 1.5),
        ),
        child: Icon(icon, color: kBlue, size: 18),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
      color: kTextDark,
      fontSize: isTotal ? 18 : 14,
      fontWeight: isTotal ? FontWeight.w800 : FontWeight.normal,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(amount, style: style),
      ],
    );
  }
}