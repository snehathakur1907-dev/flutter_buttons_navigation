import 'package:flutter/material.dart';

class ButtonGalleryScreen extends StatelessWidget {
  const ButtonGalleryScreen({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Gallery'),
        actions: [
          IconButton(
            tooltip: 'Profile',
            icon: const Icon(Icons.person_outline),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushNamed(context, '/add'),
        icon: const Icon(Icons.add),
        label: const Text('Add'),
        tooltip: 'Open Add Screen',
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 100),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 650),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _HeaderCard(),
                      const SizedBox(height: 20),
                      Text(
                        'Standard Material Buttons',
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              ElevatedButton(
                                onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const _DetailsPreview(),
                                  ),
                                ),
                                child: const Text('Elevated Button'),
                              ),
                              FilledButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/profile'),
                                child: const Text('Filled Button'),
                              ),
                              FilledButton.tonal(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/settings'),
                                child: const Text('Filled Tonal'),
                              ),
                              OutlinedButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/details'),
                                child: const Text('Outlined Button'),
                              ),
                              TextButton(
                                onPressed: () => _showMessage(
                                  context,
                                  'Text Button pressed successfully.',
                                ),
                                child: const Text('Text Button'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Icon & Action Buttons',
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  IconButton.filled(
                                    tooltip: 'Open Profile',
                                    onPressed: () =>
                                        Navigator.pushNamed(context, '/profile'),
                                    icon: const Icon(Icons.person),
                                  ),
                                  const SizedBox(width: 12),
                                  const Text('IconButton — Profile'),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: [
                                  FilledButton.icon(
                                    onPressed: () =>
                                        Navigator.pushNamed(context, '/details'),
                                    icon: const Icon(Icons.info_outline),
                                    label: const Text('View Details'),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () => Navigator.pushNamed(
                                      context,
                                      '/settings',
                                    ),
                                    icon: const Icon(Icons.settings),
                                    label: const Text('Settings'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Custom Styled Button',
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: _CustomGradientButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/details'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Navigation Demonstration',
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.route),
                          title: const Text('Navigator.push()'),
                          subtitle: const Text(
                            'Elevated Button opens a new Details screen.',
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const _DetailsPreview(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.alt_route),
                          title: const Text('Named Routes'),
                          subtitle: const Text(
                            'Profile, Settings and Details use pushNamed().',
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('Logout'),
                          subtitle: const Text(
                            'pushReplacement() returns to Login.',
                          ),
                          trailing: FilledButton.tonal(
                            onPressed: () => Navigator.pushReplacementNamed(
                              context,
                              '/',
                            ),
                            child: const Text('Logout'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              child: Icon(
                Icons.widgets_outlined,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Material Buttons',
                    style: Theme.of(context).textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Explore button variants, icons and navigation techniques.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomGradientButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _CustomGradientButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.tertiary,
            ],
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.auto_awesome, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Custom Action',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// This local preview keeps Navigator.push() explicit and visible in the code.
class _DetailsPreview extends StatelessWidget {
  const _DetailsPreview();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const _DetailsBody(),
    );
  }
}

class _DetailsBody extends StatelessWidget {
  const _DetailsBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.touch_app, size: 72, color: Colors.green),
            SizedBox(height: 16),
            Text(
              'Navigator.push() Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'This screen was opened using Navigator.push() and can return with Navigator.pop().',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
              label: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
