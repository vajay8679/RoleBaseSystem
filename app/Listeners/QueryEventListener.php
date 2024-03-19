<?php

namespace App\Listeners;

use App\Events\QueryEvent;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class QueryEventListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  \App\Events\QueryEvent  $event
     * @return void
     */
    public function handle(QueryEvent $event)
    {
        //
    }
}
