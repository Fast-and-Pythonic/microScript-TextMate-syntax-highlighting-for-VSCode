// (?<=new\\s+)([a-zA-Z0-9_]+)(?=\\([\\s\\S]*(?<!\\()\\))
// var emailRegex = /(?<=new\s*[a-zA-Z0-9_]+\s*)([a-zA-Z0-9_]+)(?=\))/gm;
// var emailRegex = /(?<=new\s+)([a-zA-Z0-9_]+)(?=\([\s\S]*(?!\())/gm;
// var emailRegex = /(?<=new\s+)([a-zA-Z0-9_]+)(?=\([\s\S]*(?<!\()\))/gm;
// (?<=new[\\s\\d]+)([a-zA-Z0-9_]*)(?=\\([\\s\\S]*(?<!\\()\\))
// var emailRegex = /(?<=new[\s\d]+)([a-zA-Z0-9_]*)(?=\([\s\S]*\))/gm;
// var emailRegex = /new/gm;

// Подсветка параметров в создании экземпляра класса
var emailRegex = /(?<=new\s*[a-zA-Z0-9_]+\s*\([^)]*?)([a-zA-Z0-9_]+)(?=\s*=)/gm;

function isValidEmail(input) {
    return emailRegex.test(input);
}