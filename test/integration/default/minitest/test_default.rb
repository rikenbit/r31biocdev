require "minitest/autorun"
require "minitest/reporters"
Minitest::Reporters.use! [Minitest::Reporters::JUnitReporter.new(reports_dir="/tmp/result/junit")]

describe 'check R version' do
  it "check R version" do
    system('/usr/local/R-devel/bin/R CMD BATCH showversion.R')
    assert system('grep "R Under development (unstable)" showversion.Rout'), 'R version is not expected version. maybe r-base package is updated'
  end
end

describe 'check Bioconductor version' do
  it "check Bioconductor version" do
    system('/usr/local/R-devel/bin/R CMD BATCH showBioconductorVersion.R')
    # develop
    assert system('grep "Bioconductor version 3.7 (BiocInstaller 1.29.1)" showBioconductorVersion.Rout'), 'Bioconductor version is not expected version. maybe Bioconductor package is updated'
    # stable
    #assert system('grep "Bioconductor version 2.14 (BiocInstaller 1.14.2)" showBioconductorVersion.Rout'), 'Bioconductor version is not expected version. maybe Bioconductor package is updated'
  end
end
