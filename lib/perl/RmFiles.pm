package RmFiles;

my $DEBUG = 0;

sub rm_array {

    my ($dir, @files) = @_;
    foreach my $file (@files) {
        if ($DEBUG){ print "Located file: $file\n"; }
        my $cwd = `pwd`;
        chomp($cwd);
        my $path = "$cwd/$file";
        system("rm -f $path") == 0
        or die "rm -f $path failed: $?";
        if ($DEBUG){ print "Removed file: $file\n"; }
    }
}

sub rm_array_specific {

    my ($dir, @files) = @_;
    foreach my $file (@files) {
        if ($DEBUG){ print "Located file: $file\n"; }
        $dir =~ s/\/$//;
        my $path = "$dir/$file";
        system("rm -f $path") == 0
        or die "rm -f $path failed: $?";
        if ($DEBUG){ print "Removed file: $file\n"; }
    }
}

sub rm_pattern {

    my ($dir, $pat) = @_;

    opendir(DIR, $dir);

    # Note the /o to prevent multiple evaluations. If we pass in "\.",
    # we want it to match only the '.' character, not any
    # character. Without this flag, we would need to escape everything
    # with additional '\' characters.
    my @files = grep(/$pat/, readdir(DIR));

    closedir(DIR);
    if ($dir =~ /^\s*\.\s*$/) {
        rm_array($dir, @files);
    } else { 
        rm_array_specific($dir, @files);
    }
}


sub rm_pattern_rec {
 
    my ($dir, $pat) = @_;
    my @files;

    use File::Find;
    find (\&wanted, $dir);

    rm_array(@files);

    sub wanted
    {
        my $file = $File::Find::name;
        if ( $file =~ /$pat/ ) {
            push (@files, $file);
        }
    }
}


sub rm_main {
    my ($aref, $pat) = @_;
}


# Always end a module with a 1 so that it returns TRUE
1;
