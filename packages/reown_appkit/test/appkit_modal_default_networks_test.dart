import 'package:flutter_test/flutter_test.dart';
import 'package:reown_appkit/modal/utils/public/appkit_modal_default_networks.dart';

void main() {
  group('ReownAppKitModalNetworks.getCaip2Chain', () {
    test('returns CAIP-2 chainId if already in CAIP-2 format', () {
      const caip2 = 'eip155:1';
      expect(ReownAppKitModalNetworks.getCaip2Chain(caip2), caip2);
    });

    test('returns CAIP-2 chainId for mainnet chainId', () {
      // Ethereum mainnet chainId is '1'
      expect(ReownAppKitModalNetworks.getCaip2Chain('1'), 'eip155:1');
      // Polygon mainnet chainId is '137'
      expect(ReownAppKitModalNetworks.getCaip2Chain('137'), 'eip155:137');
    });

    test('returns CAIP-2 chainId for testnet chainId', () {
      // Sepolia testnet chainId is '11155111'
      expect(ReownAppKitModalNetworks.getCaip2Chain('11155111'), 'eip155:11155111');
      // Mumbai testnet chainId is '80001'
      expect(ReownAppKitModalNetworks.getCaip2Chain('80001'), 'eip155:80001');
    });

    test('returns CAIP-2 chainId for Solana mainnet', () {
      expect(
        ReownAppKitModalNetworks.getCaip2Chain('5eykt4UsFv8P8NJdTREpY1vzqKqZKvdp'),
        'solana:5eykt4UsFv8P8NJdTREpY1vzqKqZKvdp',
      );
    });
  });
}