<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

class RolesAndPermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Crear permisos
        // Crear permisos
        Permission::create(['name' => 'dashboard']);
        Permission::create(['name' => 'settings']);
        Permission::create(['name' => 'users']);
        Permission::create(['name' => 'customers']);
        Permission::create(['name' => 'shipments']);
        Permission::create(['name' => 'branches']);
        Permission::create(['name' => 'payments']);

        // Crear roles y asignarles permisos
        $admin = Role::create(['name' => 'admin']);
        $admin->givePermissionTo(['settings', 'users', 'customers', 'dashboard', 'shipments', 'branches', 'payments']);

        $user = Role::create(['name' => 'user']);
        $user->givePermissionTo(['dashboard']);

        // Asignar roles a un usuario
        $user = User::find(1); // Usuario con id 1
        if ($user) {
            $user->assignRole('admin');
        }
    }
}
