# --
# Kernel/Config/Files/Znuny4OTRSCTI.pm - adds phone to CustomerUserSearchFields
# Copyright (C) 2012-2016 Znuny GmbH, http://znuny.com/
# --
## nofilter(TidyAll::Plugin::OTRS::Perl::PerlCritic)
## nofilter(TidyAll::Plugin::OTRS::Legal::OTRSAGCopyright)

    # changed config to also use phone number as seach field
    $Self->{CustomerUser} = {
        Name   => 'Database Backend',
        Module => 'Kernel::System::CustomerUser::DB',
        Params => {
            # if you want to use an external database, add the
            # required settings
#            DSN => 'DBI:odbc:yourdsn',
#            DSN => 'DBI:mysql:database=customerdb;host=customerdbhost',
#            User => '',
#            Password => '',
            Table => 'customer_user',
            # if your frontend is unicode and the charset of your
            # customer database server is iso-8859-1, use these options.
#           SourceCharset => 'iso-8859-1',
#           DestCharset => 'utf-8',

            # CaseSensitive will control if the SQL statements need LOWER()
            #   function calls to work case insensitively. Setting this to
            #   1 will improve performance dramatically on large databases.
            CaseSensitive => 0,
        },

        # customer unique id
        CustomerKey => 'login',

        # customer #
        CustomerID             => 'customer_id',
        CustomerValid          => 'valid_id',
        CustomerUserListFields => [ 'first_name', 'last_name', 'email' ],

#        CustomerUserListFields => ['login', 'first_name', 'last_name', 'customer_id', 'email'],
#        CustomerUserSearchFields           => [ 'login', 'first_name', 'last_name', 'customer_id' ],
        CustomerUserSearchFields           => [ 'login', 'first_name', 'last_name', 'customer_id', 'phone' ],
        CustomerUserSearchPrefix           => '*',
        CustomerUserSearchSuffix           => '*',
        CustomerUserSearchListLimit        => 250,
        CustomerUserPostMasterSearchFields => ['email'],
        CustomerUserNameFields     => [ 'title', 'first_name', 'last_name' ],
        CustomerUserEmailUniqCheck => 1,
#        # show now own tickets in customer panel, CompanyTickets
#        CustomerUserExcludePrimaryCustomerID => 0,
#        # generate auto logins
#        AutoLoginCreation => 0,
#        # generate auto login prefix
#        AutoLoginCreationPrefix => 'auto',
#        # admin can change customer preferences
#        AdminSetPreferences => 1,
#        # use customer company support (reference to company, See CustomerCompany settings)
#        CustomerCompanySupport => 1,
#        # cache time to live in sec. - cache any database queries
#        CacheTTL => 0,
#        # just a read only source
#        ReadOnly => 1,
        Map => [

            # note: Login, Email and CustomerID needed!
            # var, frontend, storage, shown (1=always,2=lite), required, storage-type, http-link, readonly, http-link-target
            [ 'UserTitle',      'Title',      'title',      1, 0, 'var', '', 0 ],
            [ 'UserFirstname',  'Firstname',  'first_name', 1, 1, 'var', '', 0 ],
            [ 'UserLastname',   'Lastname',   'last_name',  1, 1, 'var', '', 0 ],
            [ 'UserLogin',      'Username',   'login',      1, 1, 'var', '', 0 ],
            [ 'UserPassword',   'Password',   'pw',         0, 0, 'var', '', 0 ],
            [ 'UserEmail',      'Email',      'email',      1, 1, 'var', '', 0 ],

#            [ 'UserEmail',      'Email', 'email',           1, 1, 'var', '$Env{"CGIHandle"}?Action=AgentTicketCompose&ResponseID=1&TicketID=$Data{"TicketID"}&ArticleID=$Data{"ArticleID"}', 0 ],
            [ 'UserCustomerID', 'CustomerID', 'customer_id', 0, 1, 'var', '', 0 ],

#            [ 'UserCustomerIDs', 'CustomerIDs', 'customer_ids', 1, 0, 'var', '', 0 ],
            [ 'UserPhone',        'Phone',       'phone',        1, 0, 'var', '', 0 ],
            [ 'UserFax',          'Fax',         'fax',          1, 0, 'var', '', 0 ],
            [ 'UserMobile',       'Mobile',      'mobile',       1, 0, 'var', '', 0 ],
            [ 'UserStreet',       'Street',      'street',       1, 0, 'var', '', 0 ],
            [ 'UserZip',          'Zip',         'zip',          1, 0, 'var', '', 0 ],
            [ 'UserCity',         'City',        'city',         1, 0, 'var', '', 0 ],
            [ 'UserCountry',      'Country',     'country',      1, 0, 'var', '', 0 ],
            [ 'UserComment',      'Comment',     'comments',     1, 0, 'var', '', 0 ],
            [ 'ValidID',          'Valid',       'valid_id',     0, 1, 'int', '', 0 ],
        ],
        # default selections
        Selections => {

#            UserTitle => {
#                'Mr.' => 'Mr.',
#                'Mrs.' => 'Mrs.',
#            },
        },
    };

1;
