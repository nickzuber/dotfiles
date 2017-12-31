// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 11,

    // font family with optional fallbacks
    fontFamily: 'Fira Code, Hasklig, Monaco, "Meslo LG M for Powerline"',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#96969b',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // set to true for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: '#f1f1f1',

    // terminal background color
    // backgroundColor: '#272733',
    backgroundColor: '#272734',

    // border color (window, tabs)
    borderColor: '#272734',

    // custom css to embed in the main window
    css: `
      .tab_tab {
        background: #263c46 !important;
        transition: all 150ms cubic-bezier(0.4, 0, 1, 1);
      }
      .tab_tab:hover {
        background: #1a2b33 !important;
      }
      
      .tab_active {
        background: #1a2b33 !important;
      }
      .tab_active:hover {
        background: #1a2b33 important;
      }
    `,

    // custom css to embed in the terminal window
    termCSS: `
      * {
        -webkit-font-feature-settings: "liga" on, "calt" on, "dlig" on !important;      
        text-rendering: optimizeLegibility !important;
      }
      .cursor-node {
        width: .35rem !important;
      }
      `,

    // custom padding
    padding: '.5rem',
    // padding: '12px 14px',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#979899',
      red: '#fc5d5b',
      green: '#62f592',
      yellow: '#f3f8a2',
      blue: '#5dc8fd',
      magenta: '#fd6dc0',
      cyan: '#9dedfd',
      white: '#f8f8f8',
      lightBlack: '#525354',
      lightRed: '#fc5d5b',
      lightGreen: '#62f592',
      lightYellow: '#f3f8a2',
      lightBlue: '#5dc8fd',
      lightMagenta: '#fd6dc0',
      lightCyan: '#9dedfd',
      lightWhite: '#ffffff'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    // make sure to use a full path if the binary name doesn't work
    // (e.g `C:\\Windows\\System32\\bash.exe` instead of just `bash.exe`)
    // if you're using powershell, make sure to remove the `--login` below
    shell: '/bin/zsh',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false
  },
  plugins: [
    'hyper-blink',
    'hypercwd',
    'hyperterm-dibdabs',
    'hyperterm-tabs',
    'hyperterm-close-on-left',
//	'hyper-hide-title',
		'hyper-pane'
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
