{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ wirelesstools ];
  services.resolved.enable = true;

  hardware.bluetooth.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  networking.enableIPv6 = false;
  networking.wireless = {
    enable = true;  # Enables wireless support via wpa_supplicant.
    userControlled = true;
    secretsFile = "/home/yuri/nixos-config/secrets/wifi-secrets-file";
    interfaces = [ "wlp60s0" ];
    driver = "wext,nl80211";
    scanOnLowSignal = false;
    networks = {
      MTS_GPON5_3654 = {
        authProtocols = [ "WPA-PSK" ];
        psk = "QaiuxXA8kr";
        # priority = 2;
        hidden = true;
        extraConfig = "proto=WPA2\npairwise=CCMP\n";
      };
      REDMI15C = {
        authProtocols = [ "WPA-PSK" ];
        psk = "azusumisucks";
        # pskRaw = "f746289c35a7a086989b2da323f25dced0441f46bd8f76eee19a6c9954e5a74f";
        priority = 9;
        hidden = true;
        extraConfig = "proto=WPA2\npairwise=CCMP\n";
      };
      bmstu_wifi = {
        authProtocols = [ "WPA-EAP" ];
        auth = ''
          scan_ssid=1
          proto=WPA2
          pairwise=CCMP
          eap=PEAP
          identity="byui24l290"
          password="pRd9fOddS1kNK"
          phase1="peaplabel=0"
          phase2="auth=MSCHAPV2"
        '';
      };
    };
  };
}
