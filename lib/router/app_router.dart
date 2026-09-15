import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/privacy_policy_screen.dart';
import '../screens/terms_screen.dart';
import '../theme/app_theme.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.primarySubtle,
                ),
                child: const Icon(Icons.error_outline, size: 40, color: AppTheme.primaryGreen),
              ),
              const SizedBox(height: 24),
              const Text(
                'Página no encontrada (404)',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.primaryDark),
              ),
              const SizedBox(height: 12),
              const Text(
                'La dirección que buscas no existe o ha sido movida. Puedes regresar a la página principal o consultar nuestras políticas.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppTheme.textSecondary, height: 1.5),
              ),
              const SizedBox(height: 28),
              ElevatedButton.icon(
                onPressed: () => context.go('/'),
                icon: const Icon(Icons.home, size: 18),
                label: const Text('Volver al Inicio'),
              ),
            ],
          ),
        ),
      ),
    ),
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/politicas-de-privacidad',
        name: 'privacy',
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      // Alias route for Google Verification in English
      GoRoute(
        path: '/privacy',
        name: 'privacy-en',
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: '/condiciones-de-servicio',
        name: 'terms',
        builder: (context, state) => const TermsScreen(),
      ),
      // Alias route for Terms in English
      GoRoute(
        path: '/terms',
        name: 'terms-en',
        builder: (context, state) => const TermsScreen(),
      ),
    ],
  );
}
