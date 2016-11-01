#!/usr/bin/env nodejs

/*
  This program parse wavefront obj file and convert it to POVray mesh description
  Author   : Nguyen Anh Quan (naquan2112@gmail.com)
  Created  : 2016/10/30
*/

(function main() {
  var fs = require('fs'),
      readline = require('readline'),
      stream = require('stream');

  var createPovV3 = function(x, y, z) {
    return {
      'x': x,
      'y': y,
      'z': z,
      toString: function() { return '<' + x + ', ' + y + ', ' + z + '>'}
    };
  };
  var createPovV2 = function(x, y) {
    return {
      'x': x,
      'y': y,
      toString: function() { return '<' + x + ', ' + y + '>'}
    };
  };
  var createMaxMinKeeper = function() {
    var _this = {};
    var max, min;
    _this.put = function(val) {
      if (typeof(max) == 'undefined' || val > max)
        max = val;
      if (typeof(min) == 'undefined' || val < min)
        min = val;
    }
    _this.max = function() { return max; };
    _this.min = function() { return min; };
    return _this;
  };

  var getObjProcessor = function(outputFile) {
    var _this = {};

    var objectOngoing = false;
    var materialOngoing = false;
    var vectorBuffer = [], vectorOffset = 1;
    var textureBuffer = [], textureOffset = 1;
    var normalBuffer = [], normalOffset = 1;
    var vFaceBuffer = [];
    var tFaceBuffer = [];
    var nFaceBuffer = [];
    var xKeeper = createMaxMinKeeper();
    var yKeeper = createMaxMinKeeper();
    var zKeeper = createMaxMinKeeper();
    var objects = [];

    var fileWriter = fs.createWriteStream(outputFile, {
      flags: 'w'
    });

    fileWriter.write('// Created with obj2pov.js\n#version 3.7;\n\n');
    var writePovObject = function() {
      // write object header
      fileWriter.write('\n#declare ' + objectOngoing + ' = \nmesh2 {\n');
      // write vector coordinates
      fileWriter.write('\tvertex_vectors {');
      fileWriter.write('\n\t\t'+vectorBuffer.length+',');
      vectorBuffer.forEach(function(val, index, array) {
        if (index % 3 == 0)
          fileWriter.write('\n\t\t');
        fileWriter.write(val.toString());
        if (index < vectorBuffer.length - 1)
          fileWriter.write(', ');
      });
      fileWriter.write('\n\t}\n');
      // write normal coordinates
      if (0 < normalBuffer.length) {
        fileWriter.write('\tnormal_vectors {');
        fileWriter.write('\n\t\t'+normalBuffer.length+',');
        normalBuffer.forEach(function(val, index, array) {
          if (index % 3 == 0)
            fileWriter.write('\n\t\t');
          fileWriter.write(val.toString());
          if (index < normalBuffer.length - 1)
            fileWriter.write(', ');
        });
        fileWriter.write('\n\t}\n');
      }
      // write texture coordinates
      fileWriter.write('\tuv_vectors {');
      fileWriter.write('\n\t\t'+textureBuffer.length+',');
      textureBuffer.forEach(function(val, index, array) {
        if (index % 3 == 0)
          fileWriter.write('\n\t\t');
        fileWriter.write(val.toString());
        if (index < textureBuffer.length - 1)
          fileWriter.write(', ');
      });
      fileWriter.write('\n\t}\n');
      // write vector face indexes
      fileWriter.write('\tface_indices {');
      fileWriter.write('\n\t\t'+vFaceBuffer.length+',');
      vFaceBuffer.forEach(function(val, index, array) {
        if (index % 3 == 0)
          fileWriter.write('\n\t\t');
        fileWriter.write(val.toString());
        if (index < vFaceBuffer.length - 1)
          fileWriter.write(', ');
      });
      fileWriter.write('\n\t}\n');
      // write normal face indexes
      if (0 < nFaceBuffer.length) {
        fileWriter.write('\tnormal_indices {');
        fileWriter.write('\n\t\t'+nFaceBuffer.length+',');
        nFaceBuffer.forEach(function(val, index, array) {
          if (index % 3 == 0)
            fileWriter.write('\n\t\t');
          fileWriter.write(val.toString());
          if (index < nFaceBuffer.length - 1)
            fileWriter.write(', ');
        });
        fileWriter.write('\n\t}\n');
      }
      // write texture face indexes
      fileWriter.write('\tuv_indices {');
      fileWriter.write('\n\t\t'+tFaceBuffer.length+',');
      tFaceBuffer.forEach(function(val, index, array) {
        if (index % 3 == 0)
          fileWriter.write('\n\t\t');
        fileWriter.write(val.toString());
        if (index < tFaceBuffer.length - 1)
          fileWriter.write(', ');
      });
      fileWriter.write('\n\t}\n');
      // write texture
      fileWriter.write('\tuv_mapping\n\ttexture { t'+materialOngoing+' }\n');
      // end object
      fileWriter.write('}\n// end ' + objectOngoing + '\n\n');
      // reset params
      vectorOffset = vectorOffset+vectorBuffer.length;
      textureOffset = textureOffset+textureBuffer.length;
      normalOffset = normalOffset+normalBuffer.length;
      vectorBuffer = [];
      textureBuffer = [];
      normalBuffer = [];
      vFaceBuffer = [];
      tFaceBuffer = [];
      nFaceBuffer = [];
    };
    _this.materialLib = function(mtlFile) {
      var array = fs.readFileSync(mtlFile)
                    .toString().split("\n")
                    .forEach(function(val, index, array) {
        var words = val.trim().split(/\s+/);
        switch (words[0]) {
          case 'newmtl':
            materialOngoing = words[1];
            break;
          case 'map_Kd':
            fileWriter.write('#declare t' + materialOngoing + ' =\ntexture {\n');
            if (words[1].endsWith('.png'))
              fileWriter.write('\tpigment { image_map { png "' + words[1] + '" } }');
            else if (words[1].endsWith('.jpg'))
              fileWriter.write('\tpigment { image_map { jpg "' + words[1] + '" } }');
            else if (words[1].endsWith('.gif'))
                fileWriter.write('\tpigment { image_map { gif "' + words[1] + '" } }');
            fileWriter.write('\n}\n');

            materialOngoing = false;
            break;
        }
      });
    };
    _this.vector = function(vx, vy, vz) {
      if (objectOngoing) {
        writePovObject();
        objectOngoing = false;
      }

      // Keep vector max/min
      xKeeper.put(vx);
      yKeeper.put(vy);
      zKeeper.put(vz);
      vectorBuffer.push(createPovV3(vx,vy,vz));
    };
    _this.texture = function(tx, ty) {
      textureBuffer.push(createPovV2(tx, ty));
    };
    _this.normal = function(nx, ny, nz) {
      normalBuffer.push(createPovV3(nx, ny, nz));
    };
    _this.object = function(objectName) {
      objectOngoing = objectName;
      objects.push(objectName);
    };
    _this.material = function(materialName) {
      materialOngoing = materialName;
    };
    _this.face = function(v0, v1, v2,
                          t0, t1, t2,
                          n0, n1, n2) {
      vFaceBuffer.push(createPovV3(v0-vectorOffset, v1-vectorOffset, v2-vectorOffset));
      tFaceBuffer.push(createPovV3(t0-textureOffset, t1-textureOffset, t2-textureOffset));
      if (!isNaN(n0) && !isNaN(n1) && !isNaN(n2))
        nFaceBuffer.push(createPovV3(n0-normalOffset, n1-normalOffset, n2-normalOffset));
    };
    _this.endFile = function() {
      if (objectOngoing)
        writePovObject();

      if (objects.length > 0) {
        fileWriter.write('union {');
        objects.forEach(function(val, idx, arr) {
          fileWriter.write('\n\tobject {'+val+'}');
        });
        fileWriter.write('\n}\n');
      }

      console.log('x coordinate range : '+xKeeper.min()+' .. '+xKeeper.max());
      console.log('y coordinate range : '+yKeeper.min()+' .. '+yKeeper.max());
      console.log('z coordinate range : '+zKeeper.min()+' .. '+zKeeper.max());
      fileWriter.write('// x coordinate range : '+xKeeper.min()+' .. '+xKeeper.max()+'\n');
      fileWriter.write('// y coordinate range : '+yKeeper.min()+' .. '+yKeeper.max()+'\n');
      fileWriter.write('// z coordinate range : '+zKeeper.min()+' .. '+zKeeper.max()+'\n');
      // camera 1.5*(maxy minx minz) lookat miny maxx maxz
      fileWriter.write('camera {\n\tlocation <'+xKeeper.min()+'*1.5, '+yKeeper.max()+'*1.5, '+zKeeper.min()+'*1.5>' +
                       '\n\tlook_at <'+xKeeper.max()+', '+yKeeper.min()+', '+zKeeper.max()+'>\n}');
      // light maxy maxx minz
      fileWriter.write('\n\nlight_source { <'+xKeeper.max()+', '+yKeeper.max()+', '+zKeeper.min()+'> rgb 1 }\n');

      fileWriter.end();
      console.log("End processing of : " + outputFile);
    }
    return _this;
  };
  var fileProcessor = (function() {
    var _this = {};
    var options = {};
    var filenames = [];
    _this.queueFile = function(filename) {
      filenames.push(filename);
    };
    _this.on = function(option) {
      options[option] = true;
    };
    _this.off = function(option) {
      options[option] = false;
    };
    _this.startProcess = function() {
      filenames.forEach(function(val, index, array) {
        console.log("Now processing " + val);
        var objProcessor = getObjProcessor(val+'.pov');
        var instream = fs.createReadStream(val);

        var rl = readline.createInterface({
            input: instream,
            terminal: false
        });

        rl.on('line', function(line) {
          if (line.length == 0) {
            console.log('Empty line');
            return;
          }
          var words = line.trim().split(/\s+/);
          switch (words[0]) {
            case '#':
              console.log("Comment : " + line);
              break;
            case 'mtllib':
              objProcessor.materialLib(words[1]);
              break;
            case 'g':
            case 'o':
              if (words.length > 1) {
                console.log("Found object : " + words[1]);
                objProcessor.object(words[1]);
              } else
                console.log("Possible object end.");
              break;
            case 'v':
              objProcessor.vector(words[1]*1.0, words[2]*1.0, words[3]*1.0);
              break;
            case 'vt':
              objProcessor.texture(words[1]*1.0, words[2]*1.0);
              break;
            case 'vn':
              objProcessor.normal(words[1]*1.0, words[2]*1.0, words[3]*1.0);
              break;
            case 'usemtl':
              console.log("Use texture : " + words[1]);
              objProcessor.material(words[1]);
              break;
            case 'f':
              var indexes = [words[1].split('/'),
                words[2].split('/'),
                words[3].split('/')];
              objProcessor.face(indexes[0][0], indexes[1][0], indexes[2][0], // vertors
                indexes[0][1], indexes[1][1], indexes[2][1], // texture postions
                indexes[0][2], indexes[1][2], indexes[2][2]); // normals
              break;
            case '':
              console.log('Empty line start');
              break;
            default:
              console.log("Unknown line starter:" + words[0]);
          }
        }).on('close', function() {
          objProcessor.endFile();
          console.log('End of file ' + val);
        });
      });
    }
    return _this;
  })();

  process.argv.slice(2).forEach(function(val, index, array) {
    console.log('Argument #' + index + ' : ' + val);

    if (val.startsWith('+'))
      fileProcessor.on(val.slice(1));
    else if (val.startsWith('-'))
      fileProcessor.off(val.slice(1));
    else if (val.endsWith('.obj'))
      fileProcessor.queueFile(val);
  });
  fileProcessor.startProcess();
})();
