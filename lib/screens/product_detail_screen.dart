import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _addedToCart = false;

  @override
  Widget build(BuildContext context) {
    final color = Color(widget.product.color);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          widget.product.category,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
        actions: [
          // Favori butonu (AppBar'da state güncellemesi)
          StatefulBuilder(
            builder: (context, setActionState) {
              return IconButton(
                icon: Icon(
                  widget.product.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: widget.product.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    widget.product.isFavorite = !widget.product.isFavorite;
                  });
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ürün görseli
                  Container(
                    width: double.infinity,
                    height: 220,
                    color: color.withOpacity(0.08),
                    child: Center(
                      child: Text(
                        widget.product.emoji,
                        style: const TextStyle(fontSize: 90),
                      ),
                    ),
                  ),
                  // İçerik
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kategori etiketi
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            widget.product.category,
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Ürün adı
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Fiyat
                        Text(
                          '₺${widget.product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Açıklama başlığı
                        const Text(
                          'Ürün Hakkında',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Açıklama
                        Text(
                          widget.product.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Bilgi satırı
                        _InfoRow(
                          icon: Icons.verified_outlined,
                          label: 'Orijinal ürün garantisi',
                          color: color,
                        ),
                        const SizedBox(height: 8),
                        _InfoRow(
                          icon: Icons.local_shipping_outlined,
                          label: 'Ücretsiz kargo',
                          color: color,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Alt buton alanı
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 10,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _addedToCart = !_addedToCart;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _addedToCart
                            ? '${widget.product.name} sepete eklendi!'
                            : '${widget.product.name} sepetten çıkarıldı.',
                      ),
                      backgroundColor:
                          _addedToCart ? Colors.green : Colors.grey[700],
                      duration: const Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _addedToCart ? Colors.green : color,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _addedToCart
                          ? Icons.check_circle_outline
                          : Icons.shopping_cart_outlined,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _addedToCart ? 'Sepette ✓' : 'Sepete Ekle',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
