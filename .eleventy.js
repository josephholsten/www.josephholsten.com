module.exports = function(eleventyConfig) {
	eleventyConfig.setBrowserSyncConfig({
		files: './build/stylesheets/*.css'
	});
};
