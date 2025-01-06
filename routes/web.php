<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\BranchController;
use App\Http\Controllers\ClientController;
use App\Http\Controllers\MissionController;
use App\Http\Controllers\StateController;
use App\Http\Controllers\ShipmentController;
use App\Http\Controllers\PackageController;
use App\Http\Controllers\PackageShipmentController;
use App\Http\Controllers\ReceiverController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\ManifestController;
use App\Http\Controllers\DashboardController;
use App\Models\Client;
use App\Models\Package;
use App\Models\Package_shipment;
use App\Models\Shipment;
use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;

Route::get('/', function () {
    return view('web.index');
});

Route::get('/terms', function () {
    return view('web.terms');
});

Route::get('/tracking', function () {
    return view('web.tracking');
});

Route::get('/tracking/view/{id}', [ShipmentController::class, 'track'])->name('pages.shipments.tracking'); 

/*Route::get('/dashboard', function () {

    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');*/

Route::middleware('auth', 'verified')->group(function () {

    //dashboard
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/dashboard/data/{id}', [DashboardController::class, 'getShipmentsDash'])->name('dashboard.data');
    Route::get('/dashboard/show/{id}', [DashboardController::class, 'show'])->name('dashboard.show');
    Route::get('/dashboard/invoice/{id}', [DashboardController::class, 'invoice'])->name('dashboard.invoice');
    Route::get('/dashboard/editclient', [DashboardController::class, 'editClient'])->name('dashboard.editclient');
    Route::put('/dashborad/updateclient', [DashboardController::class, 'updateClient'])->name('dashboard.updateclient');

    //states
    Route::get('/states/{country_id}', [StateController::class, 'getStatesByCountry'])->name('states.byCountry');


    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

});

Route::middleware('role:admin','auth', 'verified')->group(function () {
    //branches->
    Route::get('/branch', [BranchController::class, 'index'])->name('pages.branches.index');
    Route::get('/branch/data', [BranchController::class, 'getBranches'])->name('branches.data');
    Route::get('/branch/create', [BranchController::class, 'create'])->name('pages.branches.create');
    Route::post('/branch/store', [BranchController::class, 'store'])->name('branches.store');
    Route::get('/branch/{id}/edit', [BranchController::class, 'edit'])->name('pages.branches.edit');
    Route::put('/branch/update/{id}', [BranchController::class, 'update'])->name('branches.update');
    Route::get('/branch/{id}/delete', [BranchController::class, 'destroy'])->name('branches.delete');




    //clients
    Route::get('/client', [ClientController::class, 'index'])->name('pages.clients.index');
    Route::get('/client/data', [ClientController::class, 'getClients'])->name('clients.data');
    Route::get('/client/create', [ClientController::class, 'create'])->name('pages.clients.create');
    Route::post('/client/store', [ClientController::class, 'store'])->name('clients.store');
    Route::get('/client/{id}/edit', [ClientController::class, 'edit'])->name('pages.clients.edit');
    Route::put('/client/update/{id}', [ClientController::class, 'update'])->name('clients.update');
    Route::get('/client/{id}/delete', [ClientController::class, 'destroy'])->name('clients.delete');


    //shipments
    Route::get('/shipment', [ShipmentController::class, 'index'])->name('pages.shipments.index');
    Route::get('/shipment/data', [ShipmentController::class, 'getShipments'])->name('shipments.data');
    Route::get('/shipment/create', [ShipmentController::class, 'create'])->name('pages.shipments.create');
    Route::post('/shipment/store', [ShipmentController::class, 'store'])->name('shipments.store');
    Route::get('/shipment/{id}/edit', [ShipmentController::class, 'edit'])->name('pages.shipments.edit');
    Route::put('/shipment/update/{id}', [ShipmentController::class, 'update'])->name('shipments.update');
    Route::get('/shipment/show/{id}', [ShipmentController::class, 'show'])->name('pages.shipments.show');
    Route::get('/shipment/invoice/{id}', [ShipmentController::class, 'invoice'])->name('pages.shipments.invoice');
    Route::get('/shipment/{id}/delete', [ShipmentController::class, 'destroy'])->name('shipment.delete');
    
    Route::delete('/shipment/{shipment}/attachments/{attachment}', [ShipmentController::class, 'removeAttachment'])->name('shipments.remove-attachment');


    //packages
    Route::get('/package', [PackageController::class, 'index'])->name('pages.packages.index');
    Route::get('/package/data', [PackageController::class, 'getPackages'])->name('packages.data');
    Route::get('/package/create', [PackageController::class, 'create'])->name('pages.packages.create');
    Route::post('/package/store', [PackageController::class, 'store'])->name('packages.store');
    Route::get('/package/{id}/edit', [PackageController::class, 'edit'])->name('pages.packages.edit');
    Route::put('/package/update/{id}', [PackageController::class, 'update'])->name('packages.update');
    Route::get('/package/{id}/delete', [PackageController::class, 'destroy'])->name('package.delete');


    //package_shipments
    Route::get('/package_shipment/data', [PackageShipmentController::class, 'getPackageshipment'])->name('package_shipments.data');
    Route::post('/package_shipment/store', [PackageShipmentController::class, 'store'])->name('package_shipments.store');
    Route::put('/package_shipment/update/{id}', [PackageShipmentController::class, 'update'])->name('package_shipments.update');
    Route::get('/package_shipment/{id}/delete', [PackageShipmentController::class, 'destroy'])->name('package_shipments.delete');


    //receivers
    Route::get('/receiver', [ReceiverController::class, 'index'])->name('pages.receivers.index');
    Route::get('/receiver/data', [ReceiverController::class, 'getReceivers'])->name('receivers.data');
    Route::get('/receiver/create', [ReceiverController::class, 'create'])->name('pages.receivers.create');
    Route::post('/receiver/store', [ReceiverController::class, 'store'])->name('receivers.store');
    Route::get('/receiver/{id}/edit', [ReceiverController::class, 'edit'])->name('pages.receivers.edit');
    Route::put('/receiver/update/{id}', [ReceiverController::class, 'update'])->name('receivers.update');
    Route::get('/receiver/{id}/delete', [ReceiverController::class, 'destroy'])->name('receivers.delete');

    Route::get('/receiver/{branch_id}', [ReceiverController::class, 'getReceivers2'])->name('receivers.by.branch');

    //Missions
    Route::get('/mission', [MissionController::class, 'index'])->name('pages.missions.index');
    Route::get('/mission/show/{id}', [MissionController::class, 'show'])->name('pages.missions.show');
    Route::get('/mission/data', [MissionController::class, 'getMissions'])->name('missions.data');
    Route::get('/mission/create', [MissionController::class, 'create'])->name('pages.missions.create');
    Route::post('/mission/store', [MissionController::class, 'store'])->name('missions.store');
    Route::get('/mission/{id}/edit', [MissionController::class, 'edit'])->name('pages.missions.edit');
    Route::put('/mission/update/{id}', [MissionController::class, 'update'])->name('missions.update');
    Route::get('/mission/{id}/delete', [MissionController::class, 'destroy'])->name('missions.delete');
    Route::get('/mission/{id}/change-status/', [MissionController::class, 'status'])->name('missions.change-status');

    //mission like manifest
    Route::get('/manifest/{id}', [MissionController::class, 'manifest'])->name('pages.missions.manifest');
    Route::post('/mission/{id}/add-shipments', [MissionController::class, 'addShipments'])->name('missions.add-shipments');
    Route::get('/mission/{missionId}/remove-shipment/{shipmentId}', [MissionController::class, 'removeShipment'])->name('missions.remove-shipment');
    Route::get('/mission/{id}/manifest-report', [MissionController::class, 'manifestPDF'])->name('mission.manifest-report');

    

    //Payment
    Route::get('/payment', [PaymentController::class, 'index'])->name('pages.payments.index');
    Route::get('/payment/data', [PaymentController::class, 'getPayments'])->name('payments.data');
    Route::get('/payment/create/{id}', [PaymentController::class, 'create'])->name('pages.payments.create');
    Route::post('/payment/store', [PaymentController::class, 'store'])->name('payments.store');
    Route::get('/payment/{id}/edit', [PaymentController::class, 'edit'])->name('pages.payments.edit');
    Route::put('/payment/update/{id}', [PaymentController::class, 'update'])->name('payments.update');
    Route::get('/payment/{id}/delete', [PaymentController::class, 'destroy'])->name('payments.delete');

    //Manifest
    Route::get('/manifest', [ManifestController::class, 'index'])->name('pages.manifests.index');
    Route::get('/manifest/data', [ManifestController::class, 'getManifests'])->name('manifests.data');
    Route::get('/manifest/show/{id}', [ManifestController::class, 'show'])->name('manifests.show');
    Route::get('/manifest/{id}/pdf', [ManifestController::class, 'generatePdf'])->name('manifests.generatePdf');

});


require __DIR__.'/auth.php';
