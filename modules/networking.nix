{ ... }:

{
  hardware.bluetooth.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless = {
    enable = true;  # Enables wireless support via wpa_supplicant.
    userControlled = true;
    secretsFile = "/home/yuri/.wifi-secret";
    interfaces = [ "wlp60s0" ];
    driver = "nl80211";
    networks = {
      INTERNET_WIRLESS_5G = {
        authProtocols = [ "WPA-PSK" ]; # equal to key_mgmt
        #pskRaw = "ext:psk_home";
        psk = "9139442042";
      };
      REDMI15C = {
        priority = 100;
        authProtocols = [ "WPA-PSK" ]; # equal to key_mgmt
        #pskRaw = "ext:psk_mobile";
        psk = "azusumisucks";
      };
      Moscow_WiFi_Free = {
        authProtocols = [ "NONE" ]; # equal to key_mgmt
        pskRaw = null;
      };
      bmstu_wifi = {
        authProtocols = [ "WPA-EAP" ]; # equal to key_mgmt
        auth = ''
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
  # services.zapret = {
  #   enable = false;
  #   params = [
  #     "--filter-tcp=80"
  #     "--dpi-desync=fake,fakedsplit"
  #     "--dpi-desync-autottl=2"
  #     "--dpi-desync-fooling=md5sig"
  #     "--new"
  #     "--filter-tcp=443"
  #     "--dpi-desync=fake,multidisorder"
  #     "--dpi-desync-fooling=badseq"
  #     "--dpi-desync-split-pos=midsld"
  #     "--dpi-desync-fake-tls=0x00000000"
  #   ];
  #   whitelist = [
  #     "discord.com"
  #     "googleusercontent.com"
  #     "accounts.google.com"
  #     "googleadservices.com"
  #     "googlevideo.com"
  #     "gvt1.com"
  #     "jnn-pa.googleapis.com"
  #     "play.google.com"
  #     "wide-youtube.l.google.com"
  #     "youtu.be"
  #     "youtube-nocookie.com"
  #     "youtube-ui.l.google.com"
  #     "youtube.com"
  #     "youtube.googleapis.com"
  #     "youtubeembeddedplayer.googleapis.com"
  #     "youtubei.googleapis.com"
  #     "yt-video-upload.l.google.com"
  #     "yt.be"
  #     "ytimg.com"
  #     "ggpht.com"
  #   ];
  # };
}
