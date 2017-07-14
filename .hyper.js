// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 10.5,

    // font family with optional fallbacks
    fontFamily: '"Meslo LG M for Powerline", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: '#96969b',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // set to true for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: '#f8f8f8',

    // terminal background color
    backgroundColor: '#272733',

    // border color (window, tabs)
    borderColor: '#272733',

    // custom css to embed in the main window
    css: `
      .tab_tab {
        background: #353546 !important;
        transition: all 150ms cubic-bezier(0.4, 0, 1, 1);
      }
      .tab_tab:hover {
        background: #303042 !important;
      }
      
      .tab_active {
        background: #272733 !important;
      }
      .tab_active:hover {
        background: #272733 !important;
      }
    `,

    // custom css to embed in the terminal window
    termCSS: '',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

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
      lightBlack: '#979899',
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

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    'hyper-blink',
    'hypercwd',
    'hyperterm-dibdabs',
    'hyperterm-tabs',
    'hyperterm-close-on-left',
    'hyper-hide-title'
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};