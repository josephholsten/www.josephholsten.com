require 'middleman-gh-pages'

file 'source/files/resume.pdf' => 'source/resume.html.erb' do
    sh "prince http://0.0.0.0:4567/resume.html -o source/files/resume.pdf"
end

task 'build' => 'source/files/resume.pdf'
