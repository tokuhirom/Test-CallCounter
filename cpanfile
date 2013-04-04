requires 'Scalar::Util', 1.24; # Dropped PP implementation

on test => sub {
    requires 'Test::More', 0.98;
};

on configure => sub {
};

on 'develop' => sub {
};

