{ ... }:

{
  hardware.bluetooth.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless = {
    enable = true;  # Enables wireless support via wpa_supplicant.
    userControlled = true;
    secretsFile = "/home/yuri/nixos-config/secrets/wifi-secrets-file";
    interfaces = [ "wlp60s0" ];
    driver = "wext,nl80211";
    scanOnLowSignal = false;
    networks = {
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
  services.zapret = {
    enable = false;
    params = [
      "--filter-tcp=80"
      "--dpi-desync=fake,fakedsplit"
      "--dpi-desync-autottl=2"
      "--dpi-desync-fooling=md5sig"
      "--new"
      "--filter-tcp=443"
      "--dpi-desync=fake,multidisorder"
      "--dpi-desync-fooling=badseq"
      "--dpi-desync-split-pos=midsld"
      "--dpi-desync-fake-tls=0x00000000"
    ];
    whitelist = [
      "discord.com"
      "googleusercontent.com"
      "accounts.google.com"
      "googleadservices.com"
      "googlevideo.com"
      "gvt1.com"
      "jnn-pa.googleapis.com"
      "play.google.com"
      "wide-youtube.l.google.com"
      "youtu.be"
      "youtube-nocookie.com"
      "youtube-ui.l.google.com"
      "youtube.com"
      "youtube.googleapis.com"
      "youtubeembeddedplayer.googleapis.com"
      "youtubei.googleapis.com"
      "yt-video-upload.l.google.com"
      "yt.be"
      "ytimg.com"
      "ggpht.com"
    ];
  };
}
