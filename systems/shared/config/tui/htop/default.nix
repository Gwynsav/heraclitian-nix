{ config }:

let
  set = config.home-manager.users.gw.lib.htop;
in

{
  programs.htop = {
    enable   = true;
    settings = {
      fields = with set.fields; [
        USER
        PRIORITY
        NICE
        PERCENT_CPU
        M_RESIDENT
        PERCENT_MEM
        TIME
        COMM
        PID
      ];
      hide_kernel_threads   = 1;
      hide_userland_threads = 1;
      show_program_path     = 0;
      show_cpu_usage        = 1;
      show_cpu_frequency    = 1;
      tree_view             = 1;
    } // (with set; leftMeters [
      (bar "LeftCPUs4")
    ]) // (with set; rightMeters [
      (bar "Memory")
      (bar "Swap")
      (text "Load Average")
      (text "Uptime")
    ]);
  };
}
