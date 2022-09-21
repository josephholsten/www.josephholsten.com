module.exports = function(eleventyConfig) {
  eleventyConfig.addPassthroughCopy("source/CNAME");

	eleventyConfig.setBrowserSyncConfig({
		files: './build/stylesheets/*.css'
	});
};
