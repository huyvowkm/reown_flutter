import 'package:flutter_test/flutter_test.dart';
import 'package:reown_appkit/modal/utils/public/appkit_modal_default_networks.dart';

void main() {
  group('ReownAppKitModalNetworks.getCaip2Chain', () {
    test('returns CAIP-2 chainId if already in CAIP-2 format', () {
      const caip2 = 'eip155:1';
      expect(ReownAppKitModalNetworks.getCaip2ChainId(caip2), caip2);
    });

    test('returns CAIP-2 chainId for mainnet chainId', () {
      // Ethereum mainnet chainId is '1'
      expect(ReownAppKitModalNetworks.getCaip2ChainId('1'), 'eip155:1');
      // Polygon mainnet chainId is '137'
      expect(ReownAppKitModalNetworks.getCaip2ChainId('137'), 'eip155:137');
    });

    test('returns CAIP-2 chainId for testnet chainId', () {
      // Sepolia testnet chainId is '11155111'
      expect(ReownAppKitModalNetworks.getCaip2ChainId('11155111'), 'eip155:11155111');
      // Mumbai testnet chainId is '80001'
      expect(ReownAppKitModalNetworks.getCaip2ChainId('80001'), 'eip155:80001');
    });

    test('returns CAIP-2 chainId for Solana mainnet', () {
      expect(
        ReownAppKitModalNetworks.getCaip2ChainId('5eykt4UsFv8P8NJdTREpY1vzqKqZKvdp'),
        'solana:5eykt4UsFv8P8NJdTREpY1vzqKqZKvdp',
      );
    });
  });

  group('ReownAppKitModalNetworks.getNetworkInfo', () {
    test('returns network info for mainnet CAIP-2 chainId', () {
      final networkInfo = ReownAppKitModalNetworks.getNetworkInfo('eip155:1');
      expect(networkInfo, isNotNull);
      expect(networkInfo!.name, 'Ethereum');
      expect(networkInfo.chainId, '1');
      expect(networkInfo.currency, 'ETH');
    });

    test('returns network info for mainnet plain chainId', () {
      final networkInfo = ReownAppKitModalNetworks.getNetworkInfo('137');
      expect(networkInfo, isNotNull);
      expect(networkInfo!.name, 'Polygon');
      expect(networkInfo.chainId, '137');
      expect(networkInfo.currency, 'POL');
    });

    test('returns network info for testnet chainId', () {
      final networkInfo = ReownAppKitModalNetworks.getNetworkInfo('11155111');
      expect(networkInfo, isNotNull);
      expect(networkInfo!.name, 'Sepolia');
      expect(networkInfo.chainId, '11155111');
      expect(networkInfo.currency, 'SEP');
      expect(networkInfo.isTestNetwork, true);
    });

    test('returns network info for Solana mainnet', () {
      final networkInfo = ReownAppKitModalNetworks.getNetworkInfo('5eykt4UsFv8P8NJdTREpY1vzqKqZKvdp');
      expect(networkInfo, isNotNull);
      expect(networkInfo!.name, 'Solana');
      expect(networkInfo.chainId, '5eykt4UsFv8P8NJdTREpY1vzqKqZKvdp');
      expect(networkInfo.currency, 'SOL');
    });

    test('returns null for unknown chainId', () {
      final networkInfo = ReownAppKitModalNetworks.getNetworkInfo('999999');
      expect(networkInfo, isNull);
    });
  });
}