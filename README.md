这里是 vim 的一些配置。考虑到平时会在 Mac、Linux、Windows 下使用。这些平台上有不少配置是可以共用的，但是确实也是有一些配置是平台独有的，尤其是 Windows，跟 Mac/Linux 下有挺多配置不一样。而这里又不想维护太过于复杂的兼容性，所以解决问题的方案是提供多种不同程度的配置。



- better-defaults.vimrc：三个平台可以直接拉下来使用，完美兼容。这个配置只更改或者加上了一些基本的默认配置，未配置任何插件。所以有较好的普适性。
- pluged-better-defaults.vimrc：在 better-defaults.vimrc 的基础上，加上了 vim-plug 插件管理（vim-plug 需提前装好），且配置了能大幅度提高生产效率的基础插件，配置的插件特别基础，且这些插件基本上开箱即用，默认配置即可。
- complete-backup.vimrc：最完备的配置，不一定完美兼容多平台，目前没精力维护，有些插件可能比较老了。