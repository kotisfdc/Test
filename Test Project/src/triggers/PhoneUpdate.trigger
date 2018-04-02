trigger PhoneUpdate on Account (before insert) {
    for(Account acc : trigger.New)
    {
        if(acc.Industry == 'Banking')
        {
            acc.phone = '9999';
        }
    }

}