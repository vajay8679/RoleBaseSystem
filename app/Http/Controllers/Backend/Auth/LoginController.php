<?php

namespace App\Http\Controllers\Backend\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::ADMIN_DASHBOARD;

    /**
     * show login form for admin guard
     *
     * @return void
     */
    public function showLoginForm()
    {
        return view('backend.auth.login');
    }


    /**
     * login admin
     *
     * @param Request $request
     * @return void
     */
    public function login(Request $request)
    {
        // Validate Login Data
        $request->validate([
            'email' => 'required|max:50',
            'password' => 'required',
        ]);

        // Attempt to login
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password], $request->remember)) {
            $user = Auth::user();
        }
        // If login as user fails, attempt to login as admin
        elseif (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password], $request->remember)) {
            $user = Auth::guard('admin')->user();
        } else {
            // Error: Invalid email or password
            session()->flash('error', 'Invalid email or password.');
            return back();
        }

        // Check if user already has an active session
        // if ($user->session_id && $user->session_id !== $request->session()->getId()) {
        //     // Invalidate previous session
        //     if (Auth::guard('admin')->check()) {
        //         Auth::guard('admin')->logout();
        //     } else {
        //         Auth::logout();
        //     }
        //     session()->flash('error', 'You are already logged in from another location.');
        //     return back();
        // }

        // Store new session ID
        // $user->session_id = $request->session()->getId();
        // $user->save();

        // Redirect to dashboard
        session()->flash('success', 'Successfully logged in!');
        if (Auth::guard('admin')->check()) {
            return redirect()->route('admin.dashboard');
        } else {
            return redirect()->route('admin.dashboard');
        }
    }

    /**
     * logout admin guard
     *
     * @return void
     */
    public function logout()
    {
        // Clear the session ID associated with the user
        $user = Auth::guard('admin')->user();
        $user->session_id = null;
        $user->save();

        // Logout the user
        Auth::guard('admin')->logout();

        // Redirect to the login page
        return redirect()->route('admin.login');
    }
}
