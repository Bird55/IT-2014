'use strict';

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    // Metadata.
    pkg: grunt.file.readJSON('package.json'),
    banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
      '<%= grunt.template.today("yyyy-mm-dd") %>\n' +
      '<%= pkg.homepage ? "* " + pkg.homepage + "\\n" : "" %>' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
      ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n',
    // Task configuration.
    slim: {
      dist: {
        files: {
          'index.html': 'index.slim'
        }
      }
    },
    stylus: {
          dist: {
              files: {
                  'style.css': 'style.style'
              }
          }
      },
    coffee: {
      dist: {
        files: {
          'game.js': 'game.coffee'
        }
      }
    }
  });

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-slim');
  grunt.loadNpmTasks('grunt-contrib-stylus');
  grunt.loadNpmTasks('coffee-script');

  // Default task.
  grunt.registerTask('default', ['slim', 'stylus', 'coffee']);
  grunt.registerTask('sl', ['slim']);
  grunt.registerTask('st', ['stylus']);
  grunt.registerTask('cf', ['coffee']);

};
