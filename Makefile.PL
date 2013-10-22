use inc::Module::Install;

RTx      'RT-Extension-HistoryFilter';
all_from 'lib/RT/Extension/HistoryFilter.pm';
repository 'https://github.com/cloos/RT-Extension-HistoryFilter';
readme_from;

sign;
WriteAll;
